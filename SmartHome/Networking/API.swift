import Foundation
import Combine

enum API {
    static let server = "http://127.0.0.1:8080/"
    
    enum Routes {
        static let users = "users/"
        static let appliances = "/appls/"
        static let safety = "/sft/"
        static let sensors = "/sens/"
        static let voice = "/va/"
    }
}

func postAppliance(_ name: String, _ isActive: Bool = false, _ room: String) {
    let id = String(UserDefaults.standard.integer(forKey: "user_id"))
    guard let url = URL(string: API.server + API.Routes.users + id + API.Routes.appliances) else { return }
    
    let body: [String: Any] = ["name": name, "isActive": isActive, "room": room, "user": ["id": Int(id)]]
    
    let finalBody = try? JSONSerialization.data(withJSONObject: body)
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.httpBody = finalBody
    
    request.setValue("application/json", forHTTPHeaderField: "Content-type")
    
    URLSession.shared.dataTask(with: request) { data, _, _ in
        guard data != nil else { return }
    }
    .resume()
}

func putAppliance(_ appliance: Appliances) {
    let id = String(UserDefaults.standard.integer(forKey: "user_id"))
    guard let url = URL(string: API.server + API.Routes.users + id + API.Routes.appliances + "\(appliance.id)") else { return }
    
    let body: [String: Any] = ["name": appliance.name, "room": appliance.room, "isActive": appliance.isActive, "id": appliance.id, "user": ["id": Int(id)]]
    
    let finalBody = try? JSONSerialization.data(withJSONObject: body)
    
    var request = URLRequest(url: url)
    request.httpMethod = "PUT"
    request.httpBody = finalBody
    
    request.setValue("application/json", forHTTPHeaderField: "Content-type")
    
    URLSession.shared.dataTask(with: request) { data, _, _ in
        guard data != nil else { return }
    }
    .resume()
}

func patchAppliance(_ appliance: Appliances) {
    let id = String(UserDefaults.standard.integer(forKey: "user_id"))
    guard let url = URL(string: API.server + API.Routes.users + id + API.Routes.appliances + "\(appliance.id)") else { return }
    
    let body: [String: Any] = ["name": appliance.name, "room": appliance.room, "isActive": !appliance.isActive, "id": appliance.id, "user": ["id": Int(id)!]]
    let finalBody = try? JSONSerialization.data(withJSONObject: body)
    
    var request = URLRequest(url: url)
    request.httpMethod = "PUT"
    request.httpBody = finalBody
    
    request.setValue("application/json", forHTTPHeaderField: "Content-type")
    
    URLSession.shared.dataTask(with: request) { data, _, _ in
        guard data != nil else { return }
    }
    .resume()
}

func deleteAppliance(_ applianceID: Int) {
    let id = String(UserDefaults.standard.integer(forKey: "user_id"))
    guard let url = URL(string: API.server + API.Routes.users + id + API.Routes.appliances + "\(applianceID)") else { return }
    var request = URLRequest(url: url)
    request.httpMethod = "DELETE"
    
    request.setValue("application/json", forHTTPHeaderField: "Content-type")
    
    URLSession.shared.dataTask(with: request) { data, _, _ in
        guard data != nil else { return }
    }
    .resume()
}

