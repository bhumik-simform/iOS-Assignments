//
//  UserRepository.swift
//  Assignment_Chapter_4
//
//  Created by Bhumik Poshiya on 09/06/26.
//

final class UserRepository {
    
    private let networkServices = NetworkSelector.shared.currentNetwrokService
    
    func login(with request: LogInRequestModel) async throws -> LogInResponceModel {
        try await networkServices!.request(endpoint: .login(request), responceType: LogInResponceModel.self)
    }
    
    func fetchUsers() async throws -> [UserModel] {
        let rootResponce = try await networkServices!.request(endpoint: .users, responceType: UsersResponceModel.self)
        return rootResponce.users
    }
    
    func fetchSingleUser(withId userId: Int) async throws -> UserDetailsModel {
        try await networkServices!.request(endpoint: .singleUser(userId), responceType: UserDetailsModel.self)
    }

    func createUser(with request: CreateUserRequestModel) async throws -> UserModel {
        try await networkServices!.request(endpoint: .createUser(request), responceType: UserModel.self)
    }
}
