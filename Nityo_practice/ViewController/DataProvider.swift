//
//  DataProvider.swift
//  Nityo_practice
//
//  Created by Eric chung on 2022/7/5.
//

import Foundation

class DataProvider {
    
    static let shared = DataProvider()
    
    func getUserInfo(_ completion: @escaping (UserInfo) -> Void) {
        let urlString = URL(string: "https://dimanyen.github.io/man.json")
        if let url = urlString {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                let decoder = JSONDecoder()
                if let urlData = data {
                    do {
                        let searchResponse = try decoder.decode(UserInfo.self, from: urlData)
                        DispatchQueue.main.async {
                            completion(searchResponse)
                        }
                    } catch {
                        print(error)
                    }
                } else {
                    print("error")
                }
            }
            task.resume()
        }
    }
    
    func getFriendList(_ endpoint: String, _ completion: @escaping (FriendList) -> Void) {
        let urlString = URL(string: "https://dimanyen.github.io/\(endpoint).json")
        if let url = urlString {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                let decoder = JSONDecoder()
                if let urlData = data {
                    do {
                        let searchResponse = try decoder.decode(FriendList.self, from: urlData)
                        DispatchQueue.main.async {
                            completion(searchResponse)
                        }
                    } catch {
                        print(error)
                    }
                } else {
                    print("error")
                }
            }
            task.resume()
        }
    }
}
