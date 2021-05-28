import Foundation
import Combine

protocol VoiceAssistantProvidable: AnyObject {
    func fetchAssistants() -> AnyPublisher<[VoiceAssistant], Never>
}

final class VoiceAssistantProvider: VoiceAssistantProvidable {
    func fetchAssistants() -> AnyPublisher<[VoiceAssistant], Never> {
        URLSession.shared.dataTaskPublisher(for: URL(string: Endpoint.server + Endpoint.Routes.users + "\(UserDefaults.standard.integer(forKey: "user_id"))" + Endpoint.Routes.voice)!)
            .map { $0.data }
            .decode(type: [VoiceAssistant].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

final class VoiceAssistantViewModel: ObservableObject {
    private var subs = Set<AnyCancellable>()
    private var dataProvider: VoiceAssistantProvidable
    
    @Published var list: [VoiceAssistant] = []
    
    init(dataSource: VoiceAssistantProvidable = VoiceAssistantProvider()) {
        self.dataProvider = dataSource
    }
    
    deinit {
        subs.removeAll()
    }
    
    func fetch() {
        self.dataProvider.fetchAssistants()
            .receive(on: RunLoop.main)
            .sink { [weak self] assistants in
                self?.list = assistants
            }
            .store(in: &subs)
    }
    
    func scheduledFetch() {
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
            self.fetch()
        }
    }
}
