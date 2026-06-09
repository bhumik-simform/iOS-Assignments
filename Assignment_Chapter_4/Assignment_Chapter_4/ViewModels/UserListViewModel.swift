//
//  UserViewModel.swift
//  Assignment_Chapter_4
//
//  Created by Bhumik Poshiya on 09/06/26.
//

class UserListViewModel {

    private let repository = UserRepository()

    private var userList = [UserModel]()

    var onSuccess: (() -> Void)?

    var onFailure: ((String) -> Void)?

    func userCount() -> Int {
        return userList.count
    }

    func userAt(position: Int) -> UserModel {
        return userList[position]
    }
    
    func addNewUser(_ newUser: UserModel) {
        userList.append(newUser)
    }

    func fetchUserData() {
        Task {
            do {
                userList = try await repository.fetchUsers()

                await MainActor.run {
                    self.onSuccess?()
                }

            } catch {
                await MainActor.run {
                    self.onFailure?(error.localizedDescription)
                }
            }
        }
    }
}
