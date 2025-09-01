//
//  AssignmentFreelanceApp.swift
//  AssignmentFreelance
//
//  Created by dilshad haidari on 22/08/25.
//

import SwiftUI

@main
struct AssignmentFreelanceApp: App {
    
    @StateObject private var appCoordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appCoordinator)
        }
    }
}
