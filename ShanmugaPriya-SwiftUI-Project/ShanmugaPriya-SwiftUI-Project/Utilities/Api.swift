//
//  Api.swift
//  ShanmugaPriya-SwiftUI-Project
//
//  Created by Shanmuga Priya M on 17/10/23.
//

import Foundation
class Api: ObservableObject {
    @Published var users: [User] = []
    @Published var singleUserInstance : singleUser = singleUser(id: 1, first_name: "", last_name: "", email: "", avatar: "")
    @Published var support : Support = Support(url: "https://reqres.in/#support-heading", text: "To keep ReqRes free, contributions towards server costs are appreciated!")

    func fetchUsers() {
        guard let url = URL(string: "\(WebConstants.BaseUrl)\(WebConstants.users)") else { return }
        print("url - \(url)")
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(UserResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.users = response.data
                        print(self.users)
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }
    func fetchUserById(){
        guard let url = URL(string: "\(WebConstants.BaseUrl)\(WebConstants.profile)") else { return }
        print("url - \(url)")
        URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error: \(error)")
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    print("Invalid response")
                    return
                }

                if let data = data {
                    do {
                        let response = try JSONDecoder().decode(SingleUserResponse.self, from: data)
                        self.singleUserInstance=response.data
                        print("User: \(response.data)")
                        return
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                }
            }.resume()
    }
    func addUser(newUser: User) {
          print("Adding user")
            guard let url = URL(string: "\(WebConstants.BaseUrl)\(WebConstants.users)") else {
                return
            }

            var request = URLRequest(url: url)
            request.httpMethod = "POST"

            do {
                let jsonData = try JSONEncoder().encode(newUser)
                request.httpBody = jsonData
            } catch {
                print("Error encoding user data: \(error)")
                return
            }

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error adding user: \(error)")
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Status Code: \(httpResponse.statusCode)")
                
                if let data = data, let responseString = String(data: data, encoding: .utf8) {
                   
                    print("Response Data: \(responseString)")
                } else {
                    print("No response data")
                }
            } else {
                print("Unexpected response: \(response.debugDescription)")
            }
        }.resume()
        }
}
struct UserResponse: Decodable {
    let data: [User]
}

struct Support : Decodable {
    var url : String
    var text : String
}

struct SingleUserResponse: Decodable {
    let data: singleUser
    let support : Support
}

