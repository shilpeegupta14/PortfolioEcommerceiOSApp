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

func validatePassword(mypassword : String) -> Bool
    {
        let passwordreg =  ("(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z])(?=.*[@#$%^&*]).{8,}")
        let passwordtesting = NSPredicate(format: "SELF MATCHES %@", passwordreg)
        return passwordtesting.evaluate(with: mypassword)
    }
