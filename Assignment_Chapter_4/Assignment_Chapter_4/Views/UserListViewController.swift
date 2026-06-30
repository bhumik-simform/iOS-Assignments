//
//  URLSessionViewController.swift
//  Assignment_Chapter_4
//
//  Created by Bhumik Poshiya on 09/06/26.
//

import UIKit

class UserListViewController: UIViewController {

    // MARK: IBOutlet
    @IBOutlet private weak var userTableView: UITableView!

    // MARK: UI Components
    private let activityindicator = UIActivityIndicatorView(style: .large)
    private let floatingActionBtn = UIButton(type: .system)

    // MARK: Properties
    private let viewModel = UserListViewModel()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        bindViewModel()
        showLoadingState()
        viewModel.fetchUserData()

    }

}

//MARK: Implmentation of Tableview Data Source
extension UserListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int
    {
        return viewModel.userCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        guard
            let cell = userTableView.dequeueReusableCell(
                withIdentifier: "UserTableViewCell") as? UserTableViewCell
        else {
            return UITableViewCell()
        }

        let userItem = viewModel.userAt(position: indexPath.row)
        cell.configure(user: userItem)
        return cell
    }

}

//MARK: Implmentation of Tableview Delegate
extension UserListViewController: UITableViewDelegate {

    func tableView(
        _ tableView: UITableView, didSelectRowAt indexPath: IndexPath
    ) {

        tableView.deselectRow(at: indexPath, animated: true)
        navigateToUserDetailsVC(
            userId: viewModel.userAt(position: indexPath.row).id)
    }
}

//MARK: Setup UI
extension UserListViewController {

    private func setupUI() {
        
        self.title = "Home"
        configureUserTable()
        configureActvityIndicator()
        configureFloatingActionBtn()
    }
    
    private func configureUserTable() {

        userTableView.register(
            UINib(nibName: "UserTableViewCell", bundle: nil),
            forCellReuseIdentifier: "UserTableViewCell")

        userTableView.dataSource = self
        userTableView.delegate = self
    }

    private func configureActvityIndicator() {
        activityindicator.translatesAutoresizingMaskIntoConstraints = false
        activityindicator.hidesWhenStopped = true

        view.addSubview(activityindicator)

        NSLayoutConstraint.activate([
            activityindicator.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),

            activityindicator.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),
        ]

        )
    }

    private func configureFloatingActionBtn() {

        floatingActionBtn.translatesAutoresizingMaskIntoConstraints = false

        floatingActionBtn.setImage(
            UIImage(systemName: "plus"),
            for: .normal
        )

        floatingActionBtn.tintColor = .white
        floatingActionBtn.backgroundColor = .systemBlue

        floatingActionBtn.layer.cornerRadius = 28
        floatingActionBtn.clipsToBounds = true

        floatingActionBtn.addTarget(
            self,
            action: #selector(didTapFloatingActionButton),
            for: .touchUpInside
        )

        view.addSubview(floatingActionBtn)

        NSLayoutConstraint.activate([
            floatingActionBtn.widthAnchor.constraint(equalToConstant: 56),
            floatingActionBtn.heightAnchor.constraint(equalToConstant: 56),

            floatingActionBtn.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -20
            ),

            floatingActionBtn.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -20
            ),
        ])
    }
}

// MARK: ViewModel Binding
extension UserListViewController {

    private func bindViewModel() {
        viewModel.onSuccess = { [weak self] in

            self?.hideLoadingState()
            self?.userTableView.reloadData()
        }

        viewModel.onFailure = { [weak self] message in

            self?.hideLoadingState()
            self?.showAlertBox(message: message)
        }
    }
}

//MARK: Actions
extension UserListViewController {

    @objc private func didTapFloatingActionButton() {
        navigateToAddUserVC()
    }
}

//MARK: Navigation
extension UserListViewController {

    private func navigateToUserDetailsVC(userId: Int) {
        guard
            let destinationVC = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(
                    withIdentifier: "UserDetailsViewController")
                as? UserDetailsViewController
        else {
            return
        }

        destinationVC.userId = userId
        navigationController?.pushViewController(destinationVC, animated: true)
    }

    private func navigateToAddUserVC() {
        guard
            let destinationVC = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(
                    withIdentifier: "AddUserViewController")
                as? AddUserViewController
        else {
            return
        }
        
        destinationVC.onNewUserCreated = { [weak self] newUser in
            guard let self else { return }
            viewModel.addNewUser(newUser)
            userTableView.reloadData()
        }

        navigationController?.pushViewController(destinationVC, animated: true)
    }
}

//MARK: Helper Methods
extension UserListViewController {

    private func showAlertBox(message: String) {
        let alertBox = UIAlertController(
            title: "Unexpected Error", message: message, preferredStyle: .alert)

        let okActionBtn = UIAlertAction(title: "Okay", style: .cancel) { _ in
            self.navigationController?.popViewController(animated: true)
        }

        alertBox.addAction(okActionBtn)

        self.present(alertBox, animated: true)
    }

    private func showLoadingState() {
        activityindicator.startAnimating()
        userTableView.isHidden = true
    }

    private func hideLoadingState() {
        activityindicator.stopAnimating()
        userTableView.isHidden = false
    }

}
