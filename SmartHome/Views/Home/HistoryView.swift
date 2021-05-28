import SwiftUI

//TODO: - Implement this later
struct HistoryView: View {
    
    let historyList = ["UGBUGA M1 state: off", "UGABUGA Socket state: on", "UGABUGA Teapot state: on"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: -20) {
            Text("History 🗄")
                .font(.title3)
                .fontWeight(.semibold)
                .padding()
            
            ScrollView(showsIndicators: false) {
                ForEach(historyList, id: \.self) { action in
                    Text("\(action)")
                        .frame(maxWidth: .infinity)
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
