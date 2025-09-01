//
//  Validator.swift
//  AssignmentFreelance
//
//  Created by dilshad haidari on 24/08/25.
//

import Foundation

class Validator {

    static func isValidEmai(_ email: String) -> Bool {
        let regex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return email.range(of: regex, options: .regularExpression) != nil
    }

    
    static func isPasswordValid(_ password: String) -> Bool{
        return password.count >= 6
    }
}


;
