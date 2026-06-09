//
//  AddUserViewModel.swift
//  Assignment_Chapter_4
//
//  Created by Bhumik Poshiya on 10/06/26.
//

final class AddUserViewModel {
    
    private let repository = UserRepository()
    
    var onSuccess: ((UserModel)->Void)?
    
    var onError: ((String)->Void)?
    
    func createUser(_ request: CreateUserRequestModel) {
        
        Task {
            do {
                let newUser = try await repository.createUser(with: request)
                
                await MainActor.run {
                    self.onSuccess?(newUser)
                }
            } catch {
                
                await MainActor.run {
                    self.onError?(error.localizedDescription)
                }
            }
        }
    }
}
