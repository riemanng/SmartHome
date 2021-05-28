import Foundation
import Combine

protocol SafetyProvidable: AnyObject {
    func fetchSafeties() -> AnyPublisher<[Safety], Never>
}

final class SafetyProvider: SafetyProvidable {
    func fetchSafeties() -> AnyPublisher<[Safety], Never> {
        URLSession.shared.dataTaskPublisher(for: URL(string: API.server + API.Routes.users + "\(UserDefaults.standard.integer(forKey: "user_id"))" + API.Routes.safety)!)
            .map { $0.data }
            .decode(type: [Safety].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

final class SafetyViewModel: ObservableObject {
    private var task = Set<AnyCancellable>()
    private var dataProvider: SafetyProvidable
    
    @Published var list: [Safety] = []
    
    init(dataSource: SafetyProvidable = SafetyProvider()) {
        self.dataProvider = dataSource
        scheduledFetch()
        
    }
    
    deinit {
        task.removeAll()
    }
    
    private func fetch() {
        self.dataProvider.fetchSafeties()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] applianceList in
                self?.list = applianceList
            }
            .store(in: &task)
    }
    
    private func scheduledFetch() {
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
            self.fetch()
        }
    }
}
