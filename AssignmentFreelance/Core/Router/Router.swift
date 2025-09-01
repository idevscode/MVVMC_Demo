//
//  Router.swift
//  AssignmentFreelance
//
//  Created by dilshad haidari on 22/08/25.
//

import SwiftUI

public protocol Routable{
    associatedtype Destination: View
    var title: String {get}
    
    @ViewBuilder
    var destinationView: Destination {get}
}

enum AuthFlow: Routable{
    var destinationView: some View {
        switch self {
        case .register: RegisterScreen()
        case .forgotPassword: ForgotPasswordScreen()
        
        }
    }
    
    var title: String {
        switch self {
        case .forgotPassword:
            return "Login"
        case .register:
            return "Register"
        }
    }
    
    case  register, forgotPassword // ResetPassword
}


enum MainFlow: Routable{
    var destinationView: some View {
        switch self {
        case .selectPartner: SelectPartnerScreen()
        case .profile: MyProfileScreen()
        
        }
    }
    
    var title: String {
        switch self {
        case .selectPartner:
            return "Select Partner"
        case .profile:
            return "Profile"
        }
    }
    
    case selectPartner, profile // ResetPassword
}


public class Router<Destination: Routable>: ObservableObject {
    
    @Published var navPath = [Destination]()
    
    func navigate(to destination: Destination){
        navPath.append(destination)
    }
    
    func navigateBack(){
        navPath.removeLast()
    }
    
    func navigateToRoot(){
        navPath.removeLast(navPath.count)
    }
    
}




