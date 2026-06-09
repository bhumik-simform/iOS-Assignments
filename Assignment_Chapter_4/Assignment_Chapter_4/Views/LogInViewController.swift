//
//  LogInViewController.swift
//  Assignment_Chapter_4
//
//  Created by Bhumik Poshiya on 09/06/26.
//

import UIKit

class LogInViewController: UIViewController {

    // MARK: IBOutlet
    @IBOutlet private weak var userNameTextEdit: UITextField!
    @IBOutlet private weak var passwordTextEdit: UITextField!

    // MARK: Properties
    private let viewModel = LogInViewModel()
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
}

// MARK: ViewModel Binding
extension LogInViewController {
    
    private func bindViewModel() {
        viewModel.onLogInSucees = { [weak self] in
            guard let self else { return }
            self.navigatetoUserScreen()
        }
        
        viewModel.onError = { [weak self] message in
            guard let self else { return }
            self.showAlert(message: message)
        }
    }
}

//MARK: Actions
extension LogInViewController {

    @IBAction private func logInBtnClick(_ sender: UIButton) {

        guard let userName = userNameTextEdit.text, !userName.isEmpty,
            let password = passwordTextEdit.text, !password.isEmpty
        else {
            return
        }

        viewModel.login(userName: userName, password: password)
        
    }
}

//MARK: Navigations
extension LogInViewController {
    
    private func navigatetoUserScreen() {
        guard let destinationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserListViewController") as? UserListViewController else {
            return
        }
        
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}

//MARK: Helping Methods
extension LogInViewController {
    
    private func showAlert(message: String) {
        
        let alertBox = UIAlertController(title: "Unexpected Error", message: message, preferredStyle: .alert)
        
        let okActionBtn = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
        alertBox.addAction(okActionBtn)
        
        self.present(alertBox, animated: true)
    }
}
