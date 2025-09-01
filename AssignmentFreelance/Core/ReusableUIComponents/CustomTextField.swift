//
//  CustomTextField.swift
//  AssignmentFreelance
//
//  Created by dilshad haidari on 24/08/25.
//

import Foundation
import SwiftUI




@ViewBuilder
func AppTextField(_ title: String, text: Binding<String>) -> some View {
    TextField(title, text: Binding(get: { text.wrappedValue }, set: { value, _ in
        text.wrappedValue = value.lowercased()
    }))
    .disableAutocorrection(true)
    .textFieldStyle(.roundedBorder)
    .textInputAutocapitalization(.never)
}

