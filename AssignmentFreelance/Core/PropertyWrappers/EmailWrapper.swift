//
//  EmailWrapper.swift
//  AssignmentFreelance
//
//  Created by dilshad haidari on 24/08/25.
//

import Foundation
import Combine

@propertyWrapper
class EmailWrapper {
    private var subject: CurrentValueSubject<String, Never>
    
    var wrappedValue: String {
        get { subject.value }
        set { subject.send(newValue) }
    }
    
    /// Expose a Publisher for the raw email string
    var projectedValue: AnyPublisher<String, Never> {
        subject.eraseToAnyPublisher()
    }
    
    init(wrappedValue: String) {
        self.subject = CurrentValueSubject<String, Never>(wrappedValue)
    }
    
    /// Email validation logic
    static func isValid(_ email: String) -> Bool {
        let regex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return email.range(of: regex, options: .regularExpression) != nil
    }
    
    
}

