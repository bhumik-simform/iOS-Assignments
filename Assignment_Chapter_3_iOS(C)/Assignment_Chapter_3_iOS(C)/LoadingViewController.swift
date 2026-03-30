//
//  TempViewController.swift
//  Assignment_Chapter_3_iOS(C)
//
//  Created by Bhumik Poshiya on 01/04/26.
//

import UIKit

class LoadingViewController: UIViewController {

    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.transitionToTabBar()
        }
    }
    
    private func transitionToTabBar() {
            // 1. Find the Storyboard
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            // 2. Instantiate the Tab Bar Controller using its ID
            let tabBarVC = storyboard.instantiateViewController(withIdentifier: "MainTabBarController")
            
            // 3. Swap the root view to the Tab Bar Controller
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first {
                
                window.rootViewController = tabBarVC
                UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil)
            }
        }
}
