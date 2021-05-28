import Foundation
import Combine

protocol SensorProvidable: AnyObject {
    func fetchSensors() -> AnyPublisher<[Sensors], Never>
}


final class SensorProvider: SensorProvidable {
    func fetchSensors() -> AnyPublisher<[Sensors], Never> {
        URLSession.shared.dataTaskPublisher(for: URL(string: Endpoint.server + Endpoint.Routes.users + "\(UserDefaults.standard.integer(forKey: "user_id"))" + Endpoint.Routes.sensors)!)
            .map { $0.data }
            .decode(type: [Sensors].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

final class SensorViewModel: ObservableObject {
    
    private var subs = Set<AnyCancellable>()
    private var dataProvider: SensorProvidable
    
    @Published var list = [Sensors]()
    
    init(dataSource: SensorProvidable = SensorProvider()) {
        self.dataProvider = dataSource
        scheduledFetch()
    }
    
    deinit {
        subs.removeAll()
    }
    
    private func fetch() {
        self.dataProvider.fetchSensors()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] list in
                self?.list = list
            }
            .store(in: &subs)
    }
    
    private func scheduledFetch() {
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
            self.fetch()
        }
    }
    
}
