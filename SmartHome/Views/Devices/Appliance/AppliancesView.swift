import SwiftUI

struct AppliancesView: View {
    @EnvironmentObject var applianceVM: ApplianceViewModel
    @State private var showWorkingDevices = false
    @State private var showModal = false
    @State private var showDetailModal = false
    
    var filteredDevices: [Appliances] {
        applianceVM.list.filter { appliance in
            (!showWorkingDevices || appliance.isActive)
        }
    }
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 0) {
                Toggle("Enabled devices", isOn: $showWorkingDevices)
                    .padding()
                List(filteredDevices.reversed()) { appliance in
                    NavigationLink(destination: ApplianceDetail(appliance: appliance)) {
                        HStack {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Device name: " + appliance.name)
                            }
                            
                            Spacer()
                            
                            if appliance.isActive {
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
                    }
                    
                }
                .ignoresSafeArea()
                .navigationTitle("Appliances")
            }
            .toolbar {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.blue)
                    .onTapGesture {
                        self.showModal.toggle()
                    }
                    .rotationEffect(Angle(degrees: showModal ? 45 : 0))
                    .onTapGesture {
                        withAnimation(.spring(response: 1)){
                            showModal.toggle()
                        }
                        
                    }
            }
            
            VStack {
                Spacer()
                CreateApplianceView()
                    .offset(y: self.showModal ? 0 : UIScreen.main.bounds.height)
                    .padding()
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .animation(.default)
    }
}

struct AppliancesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AppliancesView()
        }
    }
}
