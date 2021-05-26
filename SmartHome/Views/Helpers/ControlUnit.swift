import SwiftUI

struct ControlUnit: View {
    let imageName: String // system images only (SF Symbols)
    let unitName: String
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 60)
                .foregroundColor(.orange)
            
            Text(unitName)
        }
        .padding()
    }
}
