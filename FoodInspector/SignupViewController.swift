//
//  SignupViewController.swift
//  FoodInspector
//
//  Created by Prince Geutler on 2/11/23.
//


import SwiftUI

struct SignupViewController: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Username", text: $username)
                .padding()
                .background(Color.gray)
                .cornerRadius(5.0)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray)
                .cornerRadius(5.0)
            
            SecureField("Confirm Password", text: $confirmPassword)
                .padding()
                .background(Color.gray)
                .cornerRadius(5.0)
            
            Button(action: {
                // add sign up logic here
                if self.password == self.confirmPassword {
                                    // Perform sign up action here
                                } else {
                                    self.showAlert = true
                                }
            }) {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(5.0)
            }.alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text("Password and Confirm Password do not match"), dismissButton: .default(Text("OK")))
            }
        }
        .padding(.horizontal, 50)
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


