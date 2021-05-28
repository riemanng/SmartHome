//
//  ApplianceDetail.swift
//  SmartHome
//
//  Created by Константин Доронин on 20.05.2021.
//

import SwiftUI

struct ApplianceDetail: View {
    @EnvironmentObject var viewModel: ApplianceViewModel
    
    var appliance: Appliances

    var body: some View {
        ZStack {
            
            Colors.userDetail.ignoresSafeArea()
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("id: \(appliance.id)")
                        Text("Device name: " + appliance.name)
                        Text("Placed in: " + appliance.room)
                        Text("Last update:\n" + Date(appliance.dateOfCheck).asShortDateString())
                        Text("State: " + (appliance.isActive ? "active now" : "turned off"))
                        
                    }
                    .navigationTitle(appliance.name)
                    .navigationBarBackButtonHidden(false)
                    
                    Spacer()
                    VStack(spacing: 40) {
                        Button(action: {
                            OutsideReq.Appliance().patchAppliance(appliance)
                        }, label: {
                            Image(systemName: "circle.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(appliance.isActive ? .green : .red)
                                .frame(height: 30)
                        })
                        
                        
                        
                        Button(action: {
                            OutsideReq.Appliance().deleteAppliance(appliance.id)
                        }, label: {
                            Image(systemName: "xmark.bin.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.red)
                                .frame(height: 25)
                        })
                    }
                    .padding()
                }
                .padding()
                
                Spacer()
                
            }
            
        }
    }
}
