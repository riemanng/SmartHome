import Foundation
import Combine

enum Endpoint {
    static let server = "http://127.0.0.1:8080/"
    
    enum Routes {
        static let users = "users/"
        static let appliances = "/appls/"
        static let safety = "/sft/"
        static let sensors = "/sens/"
        static let voice = "/va/"
    }
}


//TODO: - make generic solution
enum OutsideReq {
    
    struct Appliance {
        func postAppliance(_ name: String, _ isActive: Bool = false, _ room: String) {
            let id = String(UserDefaults.standard.integer(forKey: "user_id"))
            guard let url = URL(string: Endpoint.server + Endpoint.Routes.users + id + Endpoint.Routes.appliances) else { return }
            
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
            guard let url = URL(string: Endpoint.server + Endpoint.Routes.users + id + Endpoint.Routes.appliances + "\(appliance.id)") else { return }
            
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
            guard let url = URL(string: Endpoint.server + Endpoint.Routes.users + id + Endpoint.Routes.appliances + "\(appliance.id)") else { return }
            
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
            guard let url = URL(string: Endpoint.server + Endpoint.Routes.users + id + Endpoint.Routes.appliances + "\(applianceID)") else { return }
            var request = URLRequest(url: url)
            request.httpMethod = "DELETE"
            
            request.setValue("application/json", forHTTPHeaderField: "Content-type")
            
            URLSession.shared.dataTask(with: request) { data, _, _ in
                guard data != nil else { return }
            }
            .resume()
        }
        
    }
    
    
    struct Sensor {
        func postSensor(_ name: String, _ isActive: Bool = false, _ room: String) {
            let id = String(UserDefaults.standard.integer(forKey: "user_id"))
            guard let url = URL(string: Endpoint.server + Endpoint.Routes.users + id + Endpoint.Routes.sensors) else { return }
            
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
        
        func putSensor(_ sensor: Sensors) {
            let id = String(UserDefaults.standard.integer(forKey: "user_id"))
            guard let url = URL(string: Endpoint.server + Endpoint.Routes.users + id + Endpoint.Routes.sensors + "\(sensor.id)") else { return }
            
            let body: [String: Any] = ["name": sensor.name, "room": sensor.room, "isActive": sensor.isActive, "id": sensor.id, "user": ["id": Int(id)]]
            
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
        
        func deleteAppliance(_ sensorID: Int) {
            let id = String(UserDefaults.standard.integer(forKey: "user_id"))
            guard let url = URL(string: Endpoint.server + Endpoint.Routes.users + id + Endpoint.Routes.sensors + "\(sensorID)") else { return }
            var request = URLRequest(url: url)
            request.httpMethod = "DELETE"
            
            request.setValue("application/json", forHTTPHeaderField: "Content-type")
            
            URLSession.shared.dataTask(with: request) { data, _, _ in
                guard data != nil else { return }
            }
            .resume()
        }
        
    }
    
    struct Safeties {
        func postSafaty(_ name: String, _ isActive: Bool = false, _ room: String) {
            let id = String(UserDefaults.standard.integer(forKey: "user_id"))
            guard let url = URL(string: Endpoint.server + Endpoint.Routes.users + id + Endpoint.Routes.safety) else { return }
            
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
        
        func putSafety(_ safety: Safety) {
            let id = String(UserDefaults.standard.integer(forKey: "user_id"))
            guard let url = URL(string: Endpoint.server + Endpoint.Routes.users + id + Endpoint.Routes.safety + "\(safety.id)") else { return }
            
            let body: [String: Any] = ["name": safety.name, "room": safety.room, "isActive": safety.isActive, "id": safety.id, "user": ["id": Int(id)]]
            
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
        
        func deleteSafety(_ safetyID: Int) {
            let id = String(UserDefaults.standard.integer(forKey: "user_id"))
            guard let url = URL(string: Endpoint.server + Endpoint.Routes.users + id + Endpoint.Routes.safety + "\(safetyID)") else { return }
            var request = URLRequest(url: url)
            request.httpMethod = "DELETE"
            
            request.setValue("application/json", forHTTPHeaderField: "Content-type")
            
            URLSession.shared.dataTask(with: request) { data, _, _ in
                guard data != nil else { return }
            }
            .resume()
        }

    }
    
    struct VA {
        func postVA(_ name: String, _ isActive: Bool = false, _ room: String, _ message: String) {
            let id = String(UserDefaults.standard.integer(forKey: "user_id"))
            guard let url = URL(string: Endpoint.server + Endpoint.Routes.users + id + Endpoint.Routes.safety) else { return }
            
            let body: [String: Any] = ["name": name, "isActive": isActive, "message": message, "room": room, "user": ["id": Int(id)]]
            
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
        
        func putVA(_ va: VoiceAssistant) {
            let id = String(UserDefaults.standard.integer(forKey: "user_id"))
            guard let url = URL(string: Endpoint.server + Endpoint.Routes.users + id + Endpoint.Routes.voice + "\(va.id)") else { return }
            
            let body: [String: Any] = ["name": va.name, "room": va.room, "message": va.message, "isActive": va.isActive, "id": va.id, "user": ["id": Int(id)]]
            
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
        
        func deleteVA(_ vaID: Int) {
            let id = String(UserDefaults.standard.integer(forKey: "user_id"))
            guard let url = URL(string: Endpoint.server + Endpoint.Routes.users + id + Endpoint.Routes.voice + "\(vaID)") else { return }
            var request = URLRequest(url: url)
            request.httpMethod = "DELETE"
            
            request.setValue("application/json", forHTTPHeaderField: "Content-type")
            
            URLSession.shared.dataTask(with: request) { data, _, _ in
                guard data != nil else { return }
            }
            .resume()
        }
    }
}
