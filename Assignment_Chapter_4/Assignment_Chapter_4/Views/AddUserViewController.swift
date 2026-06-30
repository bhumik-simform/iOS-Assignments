//
//  AddUserViewController.swift
//  Assignment_Chapter_4
//
//  Created by Bhumik Poshiya on 10/06/26.
//

import UIKit

class AddUserViewController: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet private weak var firstNameTextField: UITextField!
    @IBOutlet private weak var lastNameTextField: UITextField!
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var imageURLTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var contactTextField: UITextField!
    @IBOutlet private weak var compnayNameTextField: UITextField!
    @IBOutlet private weak var jobTItileTextField: UITextField!
    
    //MARK: Properties
    private let viewModel = AddUserViewModel()
    
    var onNewUserCreated: ((UserModel)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Add User"
        bindViewModel()
    }
    

}

//MARK: Bind View Model
extension AddUserViewController {
    
    private func bindViewModel() {
        viewModel.onSuccess = { [weak self] newUser in
            guard let self else { return }
            self.onNewUserCreated?(newUser)
            navigationController?.popViewController(animated: true)
        }
        
        viewModel.onError = { [weak self] message in
            guard let self else { return }
            showAlert(message: message)
        }
    }
}

//MARK: Action
extension AddUserViewController {
    
    @IBAction private func onSaveBtnClicked(_ sender: UIButton) {
        guard let request = validateAndMakeRequest() else {
            return
        }
        viewModel.createUser(request)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func onCancelBtnClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}


//MARK: Helping Methods
extension AddUserViewController {
    
    private func validateAndMakeRequest() -> CreateUserRequestModel? {

        guard let firstName = firstNameTextField.text,
              !firstName.trimmingCharacters(in: .whitespaces).isEmpty else {

            showAlert(message: "Please enter first name")
            return nil
        }

        guard let lastName = lastNameTextField.text,
              !lastName.trimmingCharacters(in: .whitespaces).isEmpty else {

            showAlert(message: "Please enter last name")
            return nil
        }

        guard let username = userNameTextField.text,
              !username.trimmingCharacters(in: .whitespaces).isEmpty else {

            showAlert(message: "Please enter username")
            return nil
        }

        guard let imageURL = imageURLTextField.text,!imageURL.trimmingCharacters(in: .whitespaces).isEmpty else {
            showAlert(message: "Please enter imager URL")
            return nil
        }
        guard let email = emailTextField.text,
              !email.trimmingCharacters(in: .whitespaces).isEmpty else {

            showAlert(message: "Please enter email")
            return nil
        }

        guard let contact = contactTextField.text,
              !contact.trimmingCharacters(in: .whitespaces).isEmpty else {

            showAlert(message: "Please enter contact number")
            return nil
        }

        guard let company = compnayNameTextField.text,
              !company.trimmingCharacters(in: .whitespaces).isEmpty else {

            showAlert(message: "Please enter company name")
            return nil
        }

        guard let jobTitle = jobTItileTextField.text,
              !jobTitle.trimmingCharacters(in: .whitespaces).isEmpty else {

            showAlert(message: "Please enter job title")
            return nil
        }

        return CreateUserRequestModel(
            firstName: firstName,
            lastName: lastName,
            userName: username,
            imageURL: imageURL,
            email: email,
            contactNumber: contact,
            company: CreateUserRequestModel.Company(
                name: company,
                title: jobTitle
            )
        )
    }
    
    private func showAlert(message: String) {
        
        let alertBox = UIAlertController(title: "Incomplete Information", message: message, preferredStyle: .alert)
        let okayActionBtn = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
        alertBox.addAction(okayActionBtn)
        self.present(alertBox, animated: true)
    }
    
}
