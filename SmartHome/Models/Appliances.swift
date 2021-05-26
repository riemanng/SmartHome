struct Appliances: Codable, Identifiable, Hashable, Device {
    var id: Int
    var name: String
    var isActive: Bool
    var dateOfCheck: String
    var room: String
}
