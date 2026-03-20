//
//  ViewController.swift
//  Assignment_Chapter_3_iOS(A)&(B)
//
//  Created by Bhumik Poshiya on 17/03/26.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBAction func logInButtonTap(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var googleViewContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        googleViewContainer.layer.borderWidth = 1.0
        googleViewContainer.layer.borderColor = UIColor.systemGray.cgColor
    }
    
    
    
    
    @IBOutlet weak var appIconTopGap: NSLayoutConstraint!
    @IBOutlet weak var primaryFormTopGap: NSLayoutConstraint!
    @IBOutlet weak var secondaryFormTopGap: NSLayoutConstraint!
    @IBOutlet weak var tCLabelTopGap: NSLayoutConstraint!
    @IBOutlet weak var footerStackViewTopGap: NSLayoutConstraint!
    @IBOutlet weak var footerStackViewBottomGap: NSLayoutConstraint!
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let currentSafeViewHeight = view.safeAreaLayoutGuide.layoutFrame.height
        let appIconTopRatio: CGFloat = 16.0/860.0
        let primaryFormTopRatio: CGFloat = 16.0/860.0
        let secondaryFormTopRatio: CGFloat = 40.0/860.0
        let tCLabelTopRatio: CGFloat = 40.0/860.0
        let footerStackTopRatio: CGFloat = 40.0/860.0
        let footerStackBottomRatio: CGFloat = 16.0/860.0
        
        appIconTopGap.constant = appIconTopRatio * currentSafeViewHeight
        primaryFormTopGap.constant = primaryFormTopRatio * currentSafeViewHeight
        secondaryFormTopGap.constant = secondaryFormTopRatio * currentSafeViewHeight
        tCLabelTopGap.constant = tCLabelTopRatio * currentSafeViewHeight
        footerStackViewTopGap.constant =  footerStackTopRatio * currentSafeViewHeight
        footerStackViewBottomGap.constant =  footerStackBottomRatio * currentSafeViewHeight
    }
    
}

