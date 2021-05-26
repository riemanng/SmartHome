//
//  RegisterView.swift
//  SmartHome
//
//  Created by Константин Доронин on 11.05.2021.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        NavigationView {
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
                    
                    
                    VStack(alignment: .leading) {
                        TextField("Username", text: $viewModel.username)
                            .padding()
                            .background(Color.black.opacity(0.08))
                            .cornerRadius(10)
                            .padding(.bottom, 20)
                            .disableAutocorrection(true)
                        Text(viewModel.usernameError)
                            .font(.subheadline)
                            .foregroundColor(.red)
                            .offset(y: -15)
                    }
                    
                    
                    
                    VStack(alignment: .leading) {
                        TextField("Email", text: $viewModel.email)
                            .padding()
                            .background(Color.black.opacity(0.08))
                            .cornerRadius(10)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                        Text(viewModel.emailError)
                            .font(.subheadline)
                            .foregroundColor(.red)
                    }
                    
                    
                    VStack {
                        NavigationLink(destination: DescriptionView()) {
                            RegisterButton()
                        }
                        .disabled(!viewModel.isValid)
                        
                        
//                        Button(action: {}) {
//                            Text("Already registred? Log in!")
//                                .font(.subheadline)
//                                .foregroundColor(.secondary)
//                                .padding()
//
//                        }
                        
                    }
                    .offset(y: 20)
                    .onDisappear {
                        viewModel.createUser(viewModel.username, viewModel.email)
                    }
                }
                .padding()
                
            }
        }
    }
    
    init() {
        UINavigationBar.appearance().isHidden = false
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
