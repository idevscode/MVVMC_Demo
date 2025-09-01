//
//  ContentView.swift
//  AssignmentFreelance
//
//  Created by dilshad haidari on 22/08/25.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var appCoordinator: AppCoordinator
    
    var body: some View {
          Group {
            switch appCoordinator.currentFlow {
            case .auth:
                AuthFlowView()
            case .main:
                MainFlowView()
          }
        }
    }
}
