//
//  MainFlowView.swift
//  AssignmentFreelance
//
//  Created by dilshad haidari on 27/08/25.
//

import SwiftUI

// MARK: - Flow Views (FIXED - NavigationStack in the right place)
struct MainFlowView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    @StateObject private var mainRouter: Router<MainFlow> = Router<MainFlow>()

    let mainRepositoryProvider = MainRepositoryProvider(networkExecutor: NetworkClient(), jsonDecoder: SwiftJsonDecoder())
    
    var body: some View {
        // ✅ NavigationStack with path binding MUST be at the top level
        NavigationStack(path: $mainRouter.navPath) {
            Group{
                MainScreen()
                    .environmentObject(mainRouter)
                    .environmentObject(appCoordinator)
            }
            .navigationDestination(for: MainFlow.self) { destination in
                destination.destinationView
                    .environmentObject(mainRouter)
                    .environmentObject(appCoordinator)
            }
        }
        
    }
}

#Preview {
//    MainFlowView()
}
