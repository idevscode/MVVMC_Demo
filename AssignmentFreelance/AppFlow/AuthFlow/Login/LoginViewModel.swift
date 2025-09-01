//
//  LoginViewModel.swift
//  AssignmentFreelance
//
//  Created by dilshad haidari on 24/08/25.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    
    
    @Published var email: String = ""
    @Published var password = ""
    @Published var isValid: Bool = false
    private var cancellables = Set<AnyCancellable>()
    var authRepositoryProvider: AuthRepositoryProvider
    
    @Published var isLoading = false
    
    init(authRepositoryProvider: AuthRepositoryProvider) {
        self.authRepositoryProvider = authRepositoryProvider
        
        Publishers.CombineLatest($email, $password)
            .map { mail, password in
                            return Validator.isValidEmai(mail) && Validator.isPasswordValid(password)
             }.assign(to: \.isValid, on: self)
            .store(in: &cancellables)
        
    }
    
    func login(completion: @escaping () -> Void) {
        authRepositoryProvider.loginReqRes(email: email, password: password) { response, error in
            
            print("response: \(String(describing: response)) error: \(String(describing: error))")
            
            guard let resp = response as? LoginModelReqRes else{
                return
            }
            
            self.saveToken(resp.token)
            completion()
            print("retrieve token :: \(String(describing: self.retrieveToken()))")
            
            
        }
    }
    
    func saveToken(_ token: String) {
        guard let tokenData = token.data(using: .utf8) else { return }
        print("tokenData :: \(tokenData)")
        let query: [String: Any] = [
            kSecClass as String       : kSecClassGenericPassword,
            kSecAttrAccount as String: "authToken",
            kSecValueData as String  : tokenData
        ]

        SecItemDelete(query as CFDictionary) // Remove existing if any
        SecItemAdd(query as CFDictionary, nil)
    }
    
    func retrieveToken() -> String? {
        let query: [String: Any] = [
            kSecClass as String       : kSecClassGenericPassword,
            kSecAttrAccount as String: "authToken",
            kSecMatchLimit as String  : kSecMatchLimitOne,
            kSecReturnData as String  : true
        ]
        
        var item: CFTypeRef?
            let status = SecItemCopyMatching(query as CFDictionary, &item)

            if status == errSecSuccess {
                if let data = item as? Data,
                   let token = String(data: data, encoding: .utf8) {
                    return token
                }
            }

            return nil
    }
    

    
    
    
    
    
    
    
    
}



