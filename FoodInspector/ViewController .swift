import SwiftUI

struct ViewController: View {
    @State private var showLogin = false
      @State private var showSignup = false
    var body: some View {
        VStack(spacing: 16) {
            Button(action: {
                // Login action
                self.showLogin = true
            }) {
                Text("Login")
            }

            Button(action: {
                // Signup action
                self.showSignup = true
            }) {
                Text("Sign Up")
            }.sheet(isPresented: $showLogin) {
                   LoginViewController()
               }
               .sheet(isPresented: $showSignup) {
                   SignupViewController()
        }.padding()
    }
}
}
