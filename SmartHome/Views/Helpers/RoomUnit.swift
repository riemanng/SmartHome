import SwiftUI

struct RoomUnit: View {
    let imageName: String
    let unitName: String
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 65)
            
            Text(unitName)
        }
        .padding()
    }
}
