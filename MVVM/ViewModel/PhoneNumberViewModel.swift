//
//  PhoneNumberViewModel.swift
//  MVVM
//


import Foundation

final class PhoneNumberViewModel: ObservableObject {
    @Published var phoneNumber: String = ""
    @Published var resultText: String = ""
    
    let phoneNumberFormatter: PhoneNumberFormatterProtocol

    init(phoneNumberFormatter: PhoneNumberFormatterProtocol = PhoneNumberFormatter()) {
        self.phoneNumberFormatter = phoneNumberFormatter
    }

    func formatPhoneNumber() {
        guard let formattedNumber = phoneNumberFormatter.format(phoneNumber: phoneNumber) else {
            resultText = "Ошибка: неверный формат номера"
            return
        }
        resultText = formattedNumber
        
        ClipboardManager.shared.copyToClipboard(text: formattedNumber)

    }
}
