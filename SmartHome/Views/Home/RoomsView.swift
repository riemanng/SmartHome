//
//  RoomsView.swift
//  SmartHome
//
//  Created by Константин Доронин on 11.05.2021.
//

import SwiftUI

enum Rooms {
    case room
    case kitchen
    case livingRoom
    case other
}

struct RoomsView: View {
    
    @EnvironmentObject var applianceVM: ApplianceViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: -30) {
            Text("Rooms 🛋")
                .font(.title3)
                .fontWeight(.semibold)
                .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    NavigationLink(destination: RoomView()) {
                        RoomUnit(imageName: "bedroom", unitName: "Rooms")
                    }
                    NavigationLink(destination: KitchenView(roomCategory: RoomCategory.kitchen.rawValue)) {
                        RoomUnit(imageName: "living_room", unitName: "Living room")
                    }
                    NavigationLink(destination: LivingRoomView()) {
                        RoomUnit(imageName: "kitchen", unitName: "Kitchen")
                    }
                    NavigationLink(destination: OtherRoomView()) {
                        RoomUnit(imageName: "door", unitName: "Other")
                    }
                }
            }
        }
        .background(Colors.roomsView)
    }
}

struct RoomsView_Previews: PreviewProvider {
    static var previews: some View {
        RoomsView()
    }
}
