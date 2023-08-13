//
//  KeychainServiceManager.swift
//  ECommerce
//
//  Created by Aditya Vyavahare(ヴィヤヴャハレ・アディティア) on 12/08/23.
//

import Foundation
import Security

class KeychainService {
    static let serviceIdentifier = "Sundarbans.com"
    
    class func savePassword(_ password: String, forAccount account: String) throws {
        guard let passwordData = password.data(using: .utf8) else {
            throw KeychainError.encodingError
        }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: serviceIdentifier,
            kSecAttrAccount as String: account,
            kSecValueData as String: passwordData
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else {
            throw KeychainError.unknownError(status)
        }
    }
    
    // Add other Keychain operations (e.g., retrieve, delete) here
}

enum KeychainError: Error {
    case unknownError(OSStatus)
    case encodingError
}
