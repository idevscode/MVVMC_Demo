//
//  MyProfileScreen.swift
//  AssignmentFreelance
//
//  Created by dilshad haidari on 27/08/25.
//

import SwiftUI

struct MyProfileScreen: View {
    
    @EnvironmentObject var router: Router<MainFlow>
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("My Profile!")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            Button("Go to Select Partner") {
                router.navigate(to: .selectPartner)
            }
        }
        .padding()
    }

}
