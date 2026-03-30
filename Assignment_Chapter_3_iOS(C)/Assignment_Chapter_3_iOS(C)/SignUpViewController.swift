//
//  SignUpViewController.swift
//  Assignment_Chapter_3_iOS(C)
//
//  Created by Bhumik Poshiya on 30/03/26.
//

import UIKit
import PhotosUI


class SignUpViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var ageValueLabel: UILabel!
    @IBOutlet weak var ageSlider: UISlider!
    @IBOutlet weak var maleRadioBtn: UIButton!
    @IBOutlet weak var femaleRadioBtn: UIButton!
    @IBOutlet weak var otherRadioBtn: UIButton!
    @IBOutlet weak var txtfield: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        profileImageView.clipsToBounds = true
        //Intialsing Gestur of tap
        let tapGestureForImage = UITapGestureRecognizer(target: self, action: #selector(tapImage))
        //Setting nuber of taps required
        tapGestureForImage.numberOfTapsRequired = 1
        //Allowing User to do any gesture on image view
        profileImageView.isUserInteractionEnabled = true
        //Adding Tap gesture on profile image view
        profileImageView.addGestureRecognizer(tapGestureForImage)

    }
    
    //Adding Tap Gesture on image
    @objc func tapImage() {
        var config = PHPickerConfiguration()
        //Only Image is able to select
        config.filter = .images
        //Maximum One Image is selected
        config.selectionLimit = 1
        
        let imagePicker = PHPickerViewController(configuration: config)
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
    
    //update age accoiding to slider
    @objc func ageUpdate() {
        ageValueLabel.text = String(Int(ageSlider.value))
    }
}

extension SignUpViewController {
    
    @IBAction func maleRadioBtnClick(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
            femaleRadioBtn.isSelected = false
            otherRadioBtn.isSelected = false
        }
    }
    
    @IBAction func femaleRadioBtnClick(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
            maleRadioBtn.isSelected = false
            otherRadioBtn.isSelected = false
        }
    }
    
    @IBAction func otherRadioBtnClick(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
            maleRadioBtn.isSelected = false
            femaleRadioBtn.isSelected = false
        }
    }
    
    @IBAction func submitBtnClicked(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let loadingVC = storyBoard.instantiateViewController(withIdentifier: "LoadingViewController")
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let window = windowScene.windows.first {
                
            window.rootViewController = loadingVC
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil)
        }
    }
    
    @IBAction func logInBtnClicked(_ sender: UIButton) {
        //Go backs to Log in view controller
        self.navigationController?.popViewController(animated: true)
    }
}

extension SignUpViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        results.first?.itemProvider.loadObject(ofClass: UIImage.self) { (currImage, error) in
            if let image = currImage as? UIImage {
                DispatchQueue.main.async {
                    self.profileImageView.image = image
                }
            }
        }
        
//        picker.setEditing(true, animated: true)
        picker.dismiss(animated: true)
    }
}
