//
//  AppCoordinator.swift
//  AssignmentFreelance
//
//  Created by dilshad haidari on 27/08/25.
//

import Foundation

enum AppFlow{
    case auth
    case main
}

class AppCoordinator: ObservableObject {
    
    @Published var currentFlow: AppFlow = .auth
    @Published var isAuthenticated = false
    @Published var showSplashScreen = true
    
    func login(){
        currentFlow = .main
        isAuthenticated = true
    }
    
    func logout(){
        currentFlow = .auth
        isAuthenticated = false
    }
}
