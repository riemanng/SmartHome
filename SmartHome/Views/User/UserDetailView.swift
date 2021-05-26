//
//  UserDetailView.swift
//  SmartHome
//
//  Created by Константин Доронин on 11.05.2021.
//

import SwiftUI

fileprivate enum Gender: String, CaseIterable {
    case male = "Male"
    case female = "Female"
    case other = "Other"
}

struct UserDetailView: View {
    
    fileprivate let genders: [Gender] = Gender.allCases
    @State private var dateOfBirth = Date()
    @State private var gender: Gender = .male
    @State private var address: String = "ugabuga"
    
    var body: some View {
        ZStack {
            
            Colors.userDetail
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                
                
                HStack(alignment: .center, spacing: 1) {
                    
                    VStack(alignment: .leading) {
                        Label("\(UserDefaults.standard.integer(forKey: "user_id"))", systemImage: "grid.circle.fill")
                        Label(UserDefaults.standard.string(forKey: "user_name") ?? "NA", systemImage: "person.fill")
                        Label(UserDefaults.standard.string(forKey: "user_email") ?? "NA", systemImage: "envelope.fill")
                    }
                    .font(.title3)
                }
                .padding()
                
                Divider()
                
                VStack(alignment: .leading, spacing: 15) {
                    Group {
                        DatePicker("Birthdate: ", selection: $dateOfBirth, in: ...Date(), displayedComponents: .date)
                        HStack {
                            Text("Gender: \(gender.rawValue)")
                            Spacer()
                            Picker("Select gender", selection: $gender) {
                                ForEach(genders, id: \.self) { gender in
                                    Text(gender.rawValue)
                                        .tag("\(gender)")
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                    }
                    
                }
                .padding()
                
                Spacer()
            }
        }
        .navigationTitle("About You")
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetailView()
        }
    }
}
