//
//  Utilities.swift
//  ECommerce
//
//  Created by Aditya Vyavahare(ヴィヤヴャハレ・アディティア) on 12/08/23.
//

import Foundation

func validateEmail(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
}
