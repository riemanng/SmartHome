import SwiftUI

struct HistoryView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: -20) {
            Text("History 🗄")
                .font(.title3)
                .fontWeight(.semibold)
                .padding()
            
            ScrollView(showsIndicators: false) {
                ForEach(1..<20) { action in
                    Text("Command №\(action)")
                        .frame(maxWidth: .infinity)
                        .offset(x: -100)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(15)
                }
                .padding()
            }
        }
        .background(Color(.sRGB, red: 230 / 255, green: 186 / 255, blue: 212 / 255, opacity: 1))
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
