import SwiftUI

struct RegisterButton: View {
        
//    var action: () -> Void
    
    var body: some View {
        Text("Register")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 160, height: 50)
            .background(Color.red.opacity(0.7))
            .cornerRadius(20)
    }
    
//    init (action: @escaping () -> Void) {
//        self.action = action
//    }
}
