import Foundation

struct Sensors: Hashable, Codable, Identifiable, Device {
    var id: Int
    var name: String
    var isActive: Bool
    var dateOfCheck: String
    var room: String
}
