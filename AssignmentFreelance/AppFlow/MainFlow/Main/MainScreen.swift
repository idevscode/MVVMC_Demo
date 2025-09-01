//
//  MainScreen.swift
//  AssignmentFreelance
//
//  Created by dilshad haidari on 27/08/25.
//
import SwiftUI

struct MainScreen: View {
    
    @EnvironmentObject var mainRouter: Router<MainFlow>
    @EnvironmentObject var appCoordinator: AppCoordinator
    
    var body: some View {
        
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("MainScreen")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                Button("Logout") {
//                    DispatchQueue.main.async { [appCoordinator] in
                        appCoordinator.logout()
//                    }
                }
                .padding()
                Button("My Profile") {
                    DispatchQueue.main.async {
                        mainRouter.navigate(to: .profile)
                    }
                    
                }
                Button("Select Profile") {
//                    DispatchQueue.main.async {
                        mainRouter.navigate(to: .selectPartner)
//                    }
                }
            }
//            .padding()
//        }
//        .navigationDestination(for: MainFlow.self) { destination in
//            destination.destinationView
//                .environmentObject(router)
//                .environmentObject(appCoordinator)
//        }
        
        
        
    }

}
