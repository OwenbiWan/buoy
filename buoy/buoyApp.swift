import SwiftUI
//import Firebase  // if you’ve already added Firebase (optional for prototype)

@main
struct BuoyApp: App {
//    init() {
        // Comment out or remove if you haven’t added Firebase yet
        // FirebaseApp.configure()
//    }

    var body: some Scene {
        WindowGroup {
            RootTabView()
        }
    }
}
