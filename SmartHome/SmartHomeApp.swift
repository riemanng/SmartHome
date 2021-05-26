//
//  SmartHomeApp.swift
//  SmartHome
//
//  Created by Константин Доронин on 11.05.2021.
//

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
