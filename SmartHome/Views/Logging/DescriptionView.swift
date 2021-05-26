//
//  DescriptionView.swift
//  SmartHome
//
//  Created by Константин Доронин on 23.05.2021.
//

import SwiftUI

struct DescriptionView: View {
    var body: some View {
        ZStack {
            
            Colors.userDetail.ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 10) {
                
                Text("attention".uppercased())
                    .font(.title)
                
                Text("By using this app you always need to have a stable internet connection. Otherwise you can have some ussues with your devices.")
                
                NavigationLink(destination: HomeView()) {
                    Text("Cool")
                    .frame(width: 100, height: 40)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding()
                    
                }
            }
            .navigationBarBackButtonHidden(true)
            .padding()
        }
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView()
    }
}
