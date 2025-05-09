import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView {
            // 1) Explore Tab
            NavigationView {
                ExploreView()
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                    .imageScale(.large)
                Text("Explore")
            }

            // 2) Create Tab (center buoy)
            NavigationView {
                CreateEventView()
            }
            .tabItem {
                Image("buoy_icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
  //              Text("Create")  // no label
            }

            // 3) Home Tab
            NavigationView {
                HomeView()
            }
            .tabItem {
                Image(systemName: "bubble.left.and.bubble.right")
                    .imageScale(.large)
                Text("Home")
            }
        }
        .accentColor(Color("BuoyOrange"))
    }
}

#if DEBUG
struct RootTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView()
            .previewDevice("iPhone 14")
    }
}
#endif
