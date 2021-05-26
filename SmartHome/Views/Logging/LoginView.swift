//
//  LoginView.swift
//  SmartHome
//
//  Created by Константин Доронин on 11.05.2021.
//

import SwiftUI

struct LoginView: View {
    @State private var id = ""
    @State private var email = ""
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.2).ignoresSafeArea()
            
            VStack {
                VStack {
                    Text("Smart Home")
                        .font(.largeTitle)
                    Text("All things under control")
                        .font(.title2)
                }
                .offset(y: -170)
                
                VStack {
                    TextField("id", text: $id)
                        .padding()
                        .background(Color.black.opacity(0.08))
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                        .disableAutocorrection(true)
                    
                    
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color.black.opacity(0.08))
                        .cornerRadius(10)
                        .disableAutocorrection(true)
                }
                
                Button(action: {}) {
                    Text("Log in")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 160, height: 50)
                        .background(Color.red.opacity(0.7))
                        .cornerRadius(20)
                }
                .padding()
                
            }
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
