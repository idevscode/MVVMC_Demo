//
//  RegisterScreen.swift
//  AssignmentFreelance
//
//  Created by dilshad haidari on 27/08/25.
//

import SwiftUI

struct RegisterScreen: View {
    
    @EnvironmentObject var router: Router<AuthFlow>
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Register")
                .padding()
            Button("Go Back") {
                router.navigateBack()
            }
        }
        .padding()
    }

}
