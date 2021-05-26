import SwiftUI

@main
struct SmartHomeApp: App {
    var body: some Scene {
        WindowGroup {
            let def = UserDefaults.standard
            let isAuth = def.bool(forKey: "is_authenticated")
            
            if isAuth {
                HomeView()
            } else {
                RegisterView()
            }
        }
    }
}
