//
//  LogINViewModel.swift
//  Assignment_Chapter_4
//
//  Created by Bhumik Poshiya on 09/06/26.
//

class LogInViewModel {
    
    private let repository = UserRepository()
    
    
    var onLogInSucees: (() -> Void)?
    var onError: ((String) -> Void)?
    
    func login(userName: String, password: String) {
        let request = LogInRequestModel(userName: userName, password: password)
        
        Task {
            do {
                let logInResponce = try await repository.login(with: request)
                
                TokenManager.shared.id = logInResponce.id
                TokenManager.shared.accessToken = logInResponce.accessToken
                TokenManager.shared.refreshToken = logInResponce.refreshToken
                
                await MainActor.run {
                    self.onLogInSucees?()
                }
                
            } catch {
                await MainActor.run {
                    self.onError?(error.localizedDescription)
                }
            }
        }
    }
}
