import Foundation


struct Safety: Hashable, Codable, Identifiable, Device {
    var id: Int
    var name: String
    var isActive: Bool
    var room: String
}
