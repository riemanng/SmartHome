//
//  HomeView.swift
//  SmartHome
//
//  Created by Константин Доронин on 11.05.2021.
//

import SwiftUI

struct HomeView: View {
    @StateObject var applianceVM = ApplianceViewModel()
    
    var body: some View {
            NavigationView {
                ZStack {
                    HomeBackground()
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 0) {
                            NavigationLink(destination: UserDetailView()) {
                                UserView()
                                    .frame(width: UIScreen.main.bounds.width, height: 120)
                            }
                            ControlView()
                            RoomsView()
                            HistoryView()
                        }
                        .foregroundColor(.black)
                    }
                    .edgesIgnoringSafeArea([.bottom, .leading, .trailing])
                }
                .navigationBarTitle("Home")
                .navigationBarBackButtonHidden(true)
                .navigationBarTitleDisplayMode(.inline)
            }
            .environmentObject(applianceVM)
        
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
