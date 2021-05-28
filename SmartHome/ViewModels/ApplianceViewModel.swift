import Foundation
import Combine

protocol ApplianceProvidable: AnyObject {
    func fetchAppliances() -> AnyPublisher<[Appliances], Never>
}

final class ApplianceProvider: ApplianceProvidable {
    
    func fetchAppliances() -> AnyPublisher<[Appliances], Never> {
        URLSession.shared.dataTaskPublisher(for: URL(string: API.server + API.Routes.users + "\(UserDefaults.standard.integer(forKey: "user_id"))" + API.Routes.appliances)!)
            .map { $0.data }
            .decode(type: [Appliances].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
            
    }
}


final class ApplianceViewModel: ObservableObject {
    
    private var task = Set<AnyCancellable>()
    private var dataProvider: ApplianceProvidable
    
    @Published var list: [Appliances] = []
    
    init(dataSource: ApplianceProvidable = ApplianceProvider()) {
        self.dataProvider = dataSource
        scheduledFetch()
        
    }
    
    deinit {
        task.removeAll()
    }
    
    private func fetch() {
        self.dataProvider.fetchAppliances()
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

