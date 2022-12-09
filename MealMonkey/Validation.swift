//
//  Validation.swift
//  MealMonkey
//
//  Created by Bimal@AppStation on 06/12/22.
//

import Foundation
class Validation {
    public func validateName(name: String) ->Bool {
          // Length be 18 characters max and 3 characters minimum, you can always modify.
          let nameRegex = "^\\w{3,18}$"
          let trimmedString = name.trimmingCharacters(in: .whitespaces)
          let validateName = NSPredicate(format: "SELF MATCHES %@", nameRegex)
          let isValidateName = validateName.evaluate(with: trimmedString)
          return isValidateName
       }
       public func validatePhoneNumber(phoneNumber: String) -> Bool {
          let phoneNumberRegex = "^[6-9]\\d{9}$"
          let trimmedString = phoneNumber.trimmingCharacters(in: .whitespaces)
          let validatePhone = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
          let isValidPhone = validatePhone.evaluate(with: trimmedString)
          return isValidPhone
       }
       public func validateEmailId(emailID: String) -> Bool {
          let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
          let trimmedString = emailID.trimmingCharacters(in: .whitespaces)
          let validateEmail = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
          let isValidateEmail = validateEmail.evaluate(with: trimmedString)
          return isValidateEmail
       }
        public func validateHeight(height: String) -> Bool {
            let heightRegex = "^[2-3]\\d{3}$"
            let trimmedString = height.trimmingCharacters(in: .whitespaces)
            let validateHei = NSPredicate(format: "SELF MATCHES %@", heightRegex)
            let isValidHeight = validateHei.evaluate(with: trimmedString)
            return isValidHeight
        }
}
