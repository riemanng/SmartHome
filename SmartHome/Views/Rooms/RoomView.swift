import SwiftUI

struct RoomView: View {
    @EnvironmentObject var applianceVM: ApplianceViewModel
    
    var roomCategory: RoomCategory.RawValue
    
    private var filteredByRoom: [Appliances] {
        applianceVM.list.filter { $0.room == roomCategory }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            List(filteredByRoom.reversed()) { device in
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Device name: " + device.name)
                    }

                    Spacer()
                    
                    if device.isActive {
                        Image(systemName: "poweron")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.green)
                            .frame(height: 20)
                            .offset(x: -11)
                    } else {
                        Image(systemName: "poweroff")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.red)
                            .frame(height: 25)
                    }
                }
                .onLongPressGesture {
                    APIResources().patchAppliance(device)
                }
            }
            .ignoresSafeArea()
            .navigationBarTitle("Room devices")
        }
        .animation(.default)
    }
}
