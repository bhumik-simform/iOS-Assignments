//
//  ViewController.swift
//  Assignment_Chapter_3_iOS(C)
//
//  Created by Bhumik Poshiya on 30/03/26.
//

import UIKit

class LogInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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

}

