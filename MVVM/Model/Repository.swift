//
//  Repository.swift
//  MVVM
//


import UIKit

final class ClipboardManager: UIResponder {
    static let shared = ClipboardManager()
    
    func copyToClipboard(text: String) {
        UIPasteboard.general.string = text
    }
}
