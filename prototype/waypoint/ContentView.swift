import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @StateObject private var session = SessionManager()

    var body: some View {
        if session.isSignedIn {
            // 🔓 Show main app after login
            TabView {
                ExploreView()
                    .tabItem {
                        Label("Explore", systemImage: "magnifyingglass")
                    }
                CreateEventView()
                    .tabItem {
                        Label("Create", systemImage: "plus.circle")
                    }
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
            }
        } else {
            // 🔒 Show login screen if not signed in
            LoginView()
        }
    }
}

class SessionManager: ObservableObject {
    @Published var isSignedIn: Bool = Auth.auth().currentUser != nil

    init() {
        // If running in SwiftUI preview, default to signed in
        if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
            isSignedIn = true
            return
        }

        _ = Auth.auth().addStateDidChangeListener { _, user in
            self.isSignedIn = user != nil
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
