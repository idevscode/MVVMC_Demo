//
//  AuthFlowView.swift
//  AssignmentFreelance
//
//  Created by dilshad haidari on 27/08/25.
//

import SwiftUI

// MARK: - Flow Views (FIXED - NavigationStack in the right place)
struct AuthFlowView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    @StateObject private var authRouter: Router<AuthFlow> = Router<AuthFlow>()
    let authRepositoryProvider = AuthRepositoryProvider(networkExecutor: NetworkClient(), jsonDecoder: SwiftJsonDecoder())
    
    var body: some View {
        // ✅ NavigationStack with path binding MUST be at the top level
        NavigationStack(path: $authRouter.navPath) {
            Group {
                if appCoordinator.showSplashScreen {
                    SplashScreen()
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                appCoordinator.showSplashScreen = false
                            }
                        }
                } else {
                    LoginScreen(authRepositoryProvider: authRepositoryProvider)
                        .environmentObject(authRouter)
                        .environmentObject(appCoordinator)
                }
            }
            .navigationDestination(for: AuthFlow.self) { destination in
                destination.destinationView
                    .environmentObject(authRouter)
                    .environmentObject(appCoordinator)
            }
        }
        
    }
}

#Preview {
    AuthFlowView()
}


struct SplashScreen: View {
    var body: some View {
        Text("Splashing")
    }
}
