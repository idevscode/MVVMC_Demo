//
//  LoginScreen.swift
//  AssignmentFreelance
//
//  Created by dilshad haidari on 23/08/25.
//

import SwiftUI

struct LoginScreen: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    @EnvironmentObject var router: Router<AuthFlow>
    @StateObject private var viewModel: LoginViewModel
        
        init(authRepositoryProvider: AuthRepositoryProvider) {
            self._viewModel = StateObject(wrappedValue: LoginViewModel(authRepositoryProvider: authRepositoryProvider))
        }
    
    var body: some View {
            VStack {
                AppTextField("Email", text: $viewModel.email)
                    .padding()
                AppTextField("Password", text: $viewModel.password)
                    .padding()
                Button("Forgot Password", action: { [router] in
                    DispatchQueue.main.async{
                        router.navigate(to: AuthFlow.forgotPassword)
                    }
                    
                })
                .padding()
                Button("Register", action: {
                    DispatchQueue.main.async{ [router] in
                        router.navigate(to: AuthFlow.register)
                    }
                    
                })
                .padding()
                Button("Submit", action: {
                    viewModel.login(completion:  {
                        DispatchQueue.main.async{ [appCoordinator] in
                            router.navigateToRoot()  // Clear auth stack
                            appCoordinator.login()
                        }
                    })
                })
                .opacity(viewModel.isValid ? 1 : 0.5)
                .disabled(!viewModel.isValid)
            }
        }
}

#Preview {
    LoginScreen(authRepositoryProvider: AuthRepositoryProvider(networkExecutor: NetworkClient(), jsonDecoder: SwiftJsonDecoder()))
}
