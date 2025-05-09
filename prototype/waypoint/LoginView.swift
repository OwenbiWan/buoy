import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack(spacing: 24) {
            Text("Welcome to Buoy 🌊")
                .font(.title)
                .bold()
            SignInButton()
        }
        .padding()
    }
}
