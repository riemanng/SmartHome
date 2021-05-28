import Foundation

struct VoiceAssistant: Hashable, Codable, Identifiable, Device {
    var id: Int
    var name: String
    var isActive: Bool
    var message: String
    var room: String
}
