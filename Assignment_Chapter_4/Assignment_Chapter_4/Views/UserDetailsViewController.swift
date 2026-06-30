//
//  UserDetailsViewController.swift
//  Assignment_Chapter_4
//
//  Created by Bhumik Poshiya on 10/06/26.
//

import UIKit

class UserDetailsViewController: UIViewController {

    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var fullNameLabel: UILabel!
    @IBOutlet private weak var professionalDetailsView: UIView!
    @IBOutlet private weak var contactDetailsView: UIView!
    @IBOutlet private weak var companyNameLabel: UILabel!
    @IBOutlet private weak var jobTitleLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var contactLabel: UILabel!

    // MARK: - Properties
    var userId: Int?

    private let activityIndicator = UIActivityIndicatorView(style: .large)

    private let viewModel = UserDetailsViewModel()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        bindViewModel()

        showLoadingState()

        viewModel.fetchUserDetails(id: userId ?? 0)
    }

    private func setupUI() {
        configureActivityIndicator()
        configureProfileImageView()
        configureDetailViews()
    }
}

//MARK: Setup UI
extension UserDetailsViewController {

    private func configureActivityIndicator() {

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true

        view.addSubview(activityIndicator)

        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),

            activityIndicator.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),
        ])
    }

    private func configureProfileImageView() {
        profileImageView.makeImageCircular()
    }

    private func configureDetailViews() {
        professionalDetailsView.layer.cornerRadius = 14
        contactDetailsView.layer.cornerRadius = 14
    }
}

// MARK: View Model Binding
extension UserDetailsViewController {

    private func bindViewModel() {
        viewModel.onSuccess = { [weak self] in

            guard let self else { return }

            self.hideLoadingState()
            self.bindData(user: self.viewModel.user)
        }

        viewModel.onFailure = { [weak self] message in

            guard let self else { return }

            self.hideLoadingState()
            self.navigationController?.popViewController(animated: true)
            self.showAlert(message: message)
        }
    }

}

// MARK: - Helper Methods
extension UserDetailsViewController {

    private func showAlert(message: String) {

        let alert = UIAlertController(
            title: "Unexpected Error",
            message: message,
            preferredStyle: .alert
        )

        let okayAction = UIAlertAction(
            title: "Okay",
            style: .cancel
        )

        alert.addAction(okayAction)

        present(alert, animated: true)
    }

    private func bindData(user: UserDetailsModel?) {

        guard let user else { return }

        profileImageView.downLoadImage(url: user.imageURL)

        fullNameLabel.text = "\(user.firstName) \(user.lastName)"

        companyNameLabel.text = user.company.name

        jobTitleLabel.text = user.company.title

        emailLabel.text = user.email

        contactLabel.text = user.contactNumber
    }
}

// MARK: View State
extension UserDetailsViewController {

    private func showLoadingState() {
        activityIndicator.startAnimating()
        contentView.isHidden = true
    }

    private func hideLoadingState() {
        activityIndicator.stopAnimating()
        contentView.isHidden = false
    }
}
