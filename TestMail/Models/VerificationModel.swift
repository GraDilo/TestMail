//
//  VerificationModel.swift
//  TestMail
//
//  Created by Эльмир Юсупов on 12.01.2023.
//

import Foundation

class VerificationModel {
    
    private let mailArray = ["@gmail.com", "@yandex.ru", "@yahoo.com" ]
    
    public var nameMail = String()
    public var filtredMailArray = [String]()
    
    private func filtringMails(text: String) {
        
        var domainMail = String()
        filtredMailArray = []
        
        guard let firstIndex = text.firstIndex(of: "@") else {return}
        let endIndex = text.index(before: text.endIndex)
        let range = text[firstIndex...endIndex]
        domainMail = String(range)
        
        mailArray.forEach { mail in
            if mail.contains(domainMail) {
                if !filtredMailArray.contains(mail){
                    filtredMailArray.append(mail)
                }
            }
        }
    }
    
    private func deriveNameMail(text: String) {
        guard let atSymbolIndex = text.firstIndex(of: "@") else {return}
        let endIndex = text.index(before: atSymbolIndex)
        let firstIndex = text.startIndex
        let range = text[firstIndex...endIndex]
        nameMail = String(range)

    }
    
    public func getFiltredMail(text: String){
        filtringMails(text: text)
    }
    
    public func getMailName(text: String) {
        deriveNameMail(text: text)
    }
}
