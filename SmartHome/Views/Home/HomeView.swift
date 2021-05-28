import SwiftUI

struct HomeView: View {
    @StateObject var applianceVM = ApplianceViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                HomeBackground()
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        NavigationLink(destination: UserDetailView()) {
                            UserView()
                                .frame(width: UIScreen.main.bounds.width, height: 120)
                        }
                        ControlView()
                        RoomsView()
                        HistoryView()
                    }
                    .foregroundColor(.black)
                }
                .edgesIgnoringSafeArea([.bottom, .leading, .trailing])
            }
            
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            
            
        }
        .environmentObject(applianceVM)
        
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
