//
//  NetworkDataFetch.swift
//  TestMail
//
//  Created by Эльмир Юсупов on 12.01.2023.
//

import Foundation

class NetworkDataFetch {
    static let shared = NetworkDataFetch()
    private init() {}
    
    func fetchMail(verifableMail: String, responce: @escaping (MailResponceModel?, Error?) -> Void) {
        NetWorkRequest.shared.requestData(verifableMail: verifableMail) { result in
            switch result {
                
            case .success(let data):
                do {
                    let mail = try JSONDecoder().decode(MailResponceModel.self, from: data)
                    responce(mail, nil)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                }
            case .failure(let error):
                print("Error received requesting data: \(error.localizedDescription)")
                responce(nil, error)
            }
        }
    }
}
