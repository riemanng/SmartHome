import SwiftUI

struct ControlView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: -25) {
            Text("Control 🎛")
                .font(.title3)
                .fontWeight(.semibold)
                .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    NavigationLink(destination: AppliancesView()) {
                        ControlUnit(imageName: "lightbulb", unitName: "Appliances")
                    }
                
                    ControlUnit(imageName: "waveform.circle", unitName: "Voice A.")
                        
                    ControlUnit(imageName: "lock.shield", unitName: "Security")
                    
                    ControlUnit(imageName: "antenna.radiowaves.left.and.right", unitName: "Sensors")
                }
            }
        }
        .background(Colors.controlView)
    }
}



struct ControlView_Previews: PreviewProvider {
    static var previews: some View {
        ControlView()
    }
}
