//
//  PhoneNumberFormatter.swift
//  MVVM
//


import Foundation

protocol PhoneNumberFormatterProtocol {
    func format(phoneNumber: String) -> String?
}

final class PhoneNumberFormatter: PhoneNumberFormatterProtocol {
    func format(phoneNumber: String) -> String? {
        var formattedNumber = phoneNumber
        
        if formattedNumber.hasPrefix("+7") && formattedNumber.count == 12  {
            formattedNumber = String(formattedNumber.dropFirst(2))
        } else if formattedNumber.hasPrefix("8") && formattedNumber.count == 11 {
            formattedNumber = String(formattedNumber.dropFirst(1))
        }
        
        let digitsOnly = formattedNumber.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        
        guard digitsOnly.count == 10 else {
            return nil
        }
       
        formattedNumber = "+7 "
        let areaCode = String(digitsOnly.prefix(3))
        let prefix = String(digitsOnly.dropFirst(3).prefix(3))
        let suffix = String(digitsOnly.dropFirst(6).prefix(2))
        let lastDigits = String(digitsOnly.dropFirst(8))
        
        formattedNumber += "(\(areaCode)) \(prefix)-\(suffix)-\(lastDigits)"
        
        return formattedNumber
    }

}
