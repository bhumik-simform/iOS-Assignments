import UIKit
//
//  Untitled.swift
//  Assignment_Chapter_3_iOS(A)&(B)
//
//  Created by Bhumik Poshiya on 19/03/26.
//

class LogInViewController: UIViewController {

    @IBOutlet weak var googleButtonContainer: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        googleButtonContainer.layer.borderWidth = 1.0
        googleButtonContainer.layer.borderColor = UIColor.systemGray.cgColor
        // Do any additional setup after loading the view.
    
    }

    
    @IBOutlet weak var appIconTopGap: NSLayoutConstraint!
    @IBOutlet weak var primaryFormTopGap: NSLayoutConstraint!
    @IBOutlet weak var scondaryFormTopGap: NSLayoutConstraint!
    @IBOutlet weak var footerStackTopGap: NSLayoutConstraint!
    @IBOutlet weak var footerStackBottomGap: NSLayoutConstraint!
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let currentSafeHeight = view.safeAreaLayoutGuide.layoutFrame.height
        
        let appIconGapRatio: CGFloat = 16.0/860.0
        let primaryGapRatio: CGFloat = 72.0/860.0
        let secondaryGapRatio: CGFloat = 8.0/860.0
        let footerTopGapRatio: CGFloat = 88.0/860.0
        let footerBottomGapRatio: CGFloat = 16.0/860.0
        
        appIconTopGap.constant = appIconGapRatio * currentSafeHeight
        primaryFormTopGap.constant = primaryGapRatio * currentSafeHeight
        scondaryFormTopGap.constant = secondaryGapRatio * currentSafeHeight
        footerStackTopGap.constant = footerTopGapRatio * currentSafeHeight
        footerStackBottomGap.constant = footerBottomGapRatio * currentSafeHeight
    }
}
