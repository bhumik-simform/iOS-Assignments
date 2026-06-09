//
//  UserDetailsViewModel.swift
//  Assignment_Chapter_4
//
//  Created by Bhumik Poshiya on 10/06/26.
//

final class UserDetailsViewModel {

    private let respository = UserRepository()

    private(set) var user: UserDetailsModel?

    var onSuccess: (() -> Void)?
    var onFailure: ((String) -> Void)?

    func fetchUserDetails(id: Int) {
        Task {
            do {
                user = try await respository.fetchSingleUser(withId: id)
                
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
