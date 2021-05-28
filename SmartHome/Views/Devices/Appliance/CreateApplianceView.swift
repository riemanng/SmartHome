import SwiftUI

enum DeviceName: String, CaseIterable {
    case ugabugaV1 = "UGABUGA M1"
    case ugabugaLamp = "UGABUGA Lamp X1"
    case ugabugaTeaPot = "UGABUGA Teapot"
    case ugabugaVM = "UB Vashing machine"
    case socket = "UGABUGA Socket"
}


//MARK: - Modal view
struct CreateApplianceView: View {
    let rooms: [RoomCategory] = RoomCategory.allCases
    let appliances: [DeviceName] = DeviceName.allCases
    
    @State private var deviceSelection: DeviceName = .ugabugaLamp
    @State private var roomSelection: RoomCategory = .room
    @State private var isActive: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {

            VStack {
                HStack {
                    Text("Device:")
                    
                    Picker("Select Device", selection: $deviceSelection) {
                        ForEach(appliances, id: \.self) { appliance in
                            Text(appliance.rawValue)
                                .tag("\(appliance)")
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Text("Selected device: \(deviceSelection.rawValue)")
            }
            
            
            Toggle("Turn on now", isOn: $isActive)
            
            Picker("Select room for your device", selection: $roomSelection) {
                ForEach(rooms, id: \.self) { room in
                    Text(room.rawValue)
                        .tag("\(room)")
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            
            Text("Selected room: \(roomSelection.rawValue)")
            
            Text("Create")
                .font(.title2)
                .fontWeight(.medium)
                .frame(width: 100, height: 40)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
                .onTapGesture { OutsideReq.Appliance().postAppliance(deviceSelection.rawValue, isActive, roomSelection.rawValue) }
        }
        .frame(maxWidth: UIScreen.main.bounds.width - 10)
        .padding(.bottom, (UIApplication.shared.windows.last?.safeAreaInsets.bottom)!)
        .padding(.horizontal)
        .padding(.top, 20)
        .background(Colors.controlView)
        .cornerRadius(20)
        
        
    }
}

struct CreateApplianceView_Previews: PreviewProvider {
    static var previews: some View {
        CreateApplianceView()
    }
}
