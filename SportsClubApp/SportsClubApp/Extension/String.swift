//
//  Swift.swift
//  SportsClubApp
//
//  Created by engin gülek on 23.01.2023.
//

import Foundation


    extension String {
        func isValidPassword() -> Bool {
            let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
            let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)

            return passwordValidation.evaluate(with: self)
        }
    }

