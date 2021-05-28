import Foundation
import Combine

final class RegisterViewModel: ObservableObject {
    private var cancellableBag = Set<AnyCancellable>()
    
    @Published var username: String = ""
    var usernameError: String = ""
    @Published var email: String = ""
    var emailError: String = ""
    @Published var id: Int = 0
    @Published var isValid: Bool = false
    @Published var authenticated: Bool = false
    
    private var usernameValidPublisher: AnyPublisher<Bool, Never> {
        return $username
            .map { !$0.isEmpty }
            .eraseToAnyPublisher()
    }
    
    private var emailRequiredPublisher: AnyPublisher<(email: String, isValid: Bool), Never> {
        $email
            .map { (email: $0, isValid: !$0.isEmpty) }
            .eraseToAnyPublisher()
    }
    
    private var emailValidPublisher: AnyPublisher<(email: String, isValid: Bool), Never> {
        emailRequiredPublisher
            .filter { $0.isValid }
            .map { (email: $0.email, isValid: validateEmail(candidate: $0.email)) }
            .eraseToAnyPublisher()
    }
    
    private var isRegisterValid: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(usernameValidPublisher, emailValidPublisher)
            .map { $0 == true && $1.isValid == true }
            .eraseToAnyPublisher()
    }
    
    init() {
        usernameValidPublisher
            .receive(on: RunLoop.main)
            .dropFirst()
            .map { $0 ? "" : "Username is missing" }
            .assign(to: \.usernameError, on: self)
            .store(in: &cancellableBag)
        
        emailRequiredPublisher
            .receive(on: RunLoop.main)
            .dropFirst()
            .map { $0.isValid ? "" : "Email is missing" }
            .assign(to: \.emailError, on: self)
            .store(in: &cancellableBag)
        
        emailValidPublisher
            .receive(on: RunLoop.main)
            .map { $0.isValid ? "" : "Email is not valid" }
            .assign(to: \.emailError, on: self)
            .store(in: &cancellableBag)
        
        isRegisterValid
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: self)
            .store(in: &cancellableBag)
    }
    
    deinit {
        cancellableBag.removeAll()
    }
    
    
    
    func createUser(_ name: String, _ email: String) {
        guard let url = URL(string: Endpoint.server + Endpoint.Routes.users) else { return }
        
        let body: [String: String] = ["name": name, "email": email]
        
        let finalBody = try? JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        
        URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data = data else { return }
            
            let responseData = try? JSONDecoder().decode(User.self, from: data)
            
            if responseData != nil {
                DispatchQueue.main.async {
                    self.authenticated = true
                    let def = UserDefaults.standard
                    def.set(responseData?.id, forKey: "user_id")
                    def.set(true, forKey: "is_authenticated")
                    def.set(responseData?.name, forKey: "user_name")
                    def.set(responseData?.email, forKey: "user_email")
                }
            } else {
                DispatchQueue.main.async {
                    self.authenticated = false
                }
            }
            
            print(responseData ?? "User with this name already exists")
        }
        .resume()
    }
    
}

func validateEmail(candidate: String) -> Bool {
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: candidate)
}
