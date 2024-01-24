//
//  NetWorkRequest.swift
//  TestMail
//
//  Created by Эльмир Юсупов on 12.01.2023.
//

import Foundation

class NetWorkRequest {
    
    static let shared = NetWorkRequest()
    private init() {}
    
    func requestData(verifableMail: String, completion: @escaping(Result<Data, Error>) -> Void) {
        
        let urlString = "https://api.kickbox.com/v2/verify?email=\(verifableMail)&apikey=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                completion(.success(data))
            }
        }
        .resume()
    }
}
