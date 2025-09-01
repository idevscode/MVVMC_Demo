//
//  SelectPartnerScreen.swift
//  AssignmentFreelance
//
//  Created by dilshad haidari on 27/08/25.
//

import SwiftUI

struct SelectPartnerScreen: View {
    
    @EnvironmentObject var router: Router<MainFlow>
    
    @StateObject var viewModel = SelectProfileViewModel()
    
    var body: some View {
        VStack{
            Text("Select Partner Screen")
                .font(.title)
                .fontWeight(.bold)
        }
    }

}
