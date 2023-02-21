//
//  LoginViewController.swift
//  FoodInspector
//
//  Created by Prince Geutler on 2/11/23.
//

import SwiftUI

struct LoginViewController: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var credentials = [String]()
    
    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .padding()
                .background(Color(.lightGray))
                .cornerRadius(5.0)
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.lightGray))
                .cornerRadius(5.0)
            Button(action: {
                // Perform action with the entered username and password
                self.credentials.append(self.username)
                self.credentials.append(self.password)
                self.sendCredentialsToServer(username: self.username, password: self.password)
            }) {
                Text("Login")
            }
        }
    }
    
    func sendCredentialsToServer(username: String, password: String) {
        let host = "localhost"
        let port = 8888
        let url = URL(string: "http://\(host):\(port)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let credentials = ["username": username, "password": password]
        let jsonData = try? JSONSerialization.data(withJSONObject: credentials, options: [])
        request.httpBody = jsonData

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error!)")
                return
            }

            if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                print("Error: \(response)")
                return
            }

            let responseString = String(data: data, encoding: .utf8)
            print("Server responded: \(responseString!)")
        }

        task.resume()
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


