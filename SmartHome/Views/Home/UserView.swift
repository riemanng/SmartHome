//
//  UserView.swift
//  SmartHome
//
//  Created by Константин Доронин on 11.05.2021.
//

import SwiftUI

struct UserView: View {
    
    let id = UserDefaults.standard.integer(forKey: "user_id")
    let name = UserDefaults.standard.string(forKey: "user_name")
    
    var body: some View {
        VStack(alignment: .leading, spacing: -15.0) {
            Text("You 👩‍💻")
                .font(.title3)
                .fontWeight(.semibold)
                .padding()
                .offset(y: 20)

            
            HStack(alignment: .center) {
                
                
                Image("memoji_example")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 80)
                    .padding()
                    .foregroundColor(Color.blue.opacity(0.8))
                
                
                Spacer()
                VStack(alignment: .leading) {
                    Text("\(name ?? "NA")")
                    Text("id: \(id)")
                }
                .font(.title2)
                .offset(x: -140)
                
                
            }
            .padding()
        }
        .frame(height: 160)
        //        .padding()
    }
    
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
        
    }
}
