import Foundation
import Combine

final class ApplianceViewModel: ObservableObject {
    
    private var task = Set<AnyCancellable>()
    private var timer: Timer?
    
    @Published var list: [Appliances] = []
    
    init() {
        fetchWithTimer()
    }
    
    deinit {
        task.removeAll()
    }
    
    func fetchAppliance() {
        URLSession.shared.dataTaskPublisher(
            for: URL(string: API.server + API.Routes.users + "\(UserDefaults.standard.integer(forKey: "user_id"))" + API.Routes.appliances)!)
            .map { $0.data }
            .decode(type: [Appliances].self, decoder: JSONDecoder())
            .replaceError(with: [Appliances(id: 1, name: "MOCK DEVICE", isActive: true, dateOfCheck: "12/12/12", room: "OTHER")])
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .assign(to: \ApplianceViewModel.list, on: self)
            .store(in: &task)
    }
    
    func fetchWithTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
            self.fetchAppliance()
        }
    }
}
