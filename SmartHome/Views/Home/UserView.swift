import SwiftUI

struct UserView: View {
    
    let id = UserDefaults.standard.integer(forKey: "user_id")
    let name = UserDefaults.standard.string(forKey: "user_name")
    
    var body: some View {
        VStack(alignment: .leading, spacing: -15.0) {
            Text("You")
                .font(.title3)
                .fontWeight(.semibold)
                .padding()
                .offset(y: 20)

            
            HStack(alignment: .center) {
                
                
                Image("profile_placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 80)
                    .padding()
                    .foregroundColor(Color.blue.opacity(0.8))
                    .offset(y: -10.0)
                
                
                Spacer()
                VStack(alignment: .leading) {
                    Text("\(name ?? "NA")")
                    Text("id: \(id)")
                }
                .font(.title2)
                .offset(x: -100)
                
                
            }
            .padding()
        }
        .frame(height: 160)
        //        .padding()
    }
    
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
        
    }
}
