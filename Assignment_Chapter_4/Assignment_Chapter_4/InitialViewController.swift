//
//  ViewController.swift
//  Assignment_Chapter_4
//
//  Created by Bhumik Poshiya on 09/06/26.
//

import UIKit

class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction private func URLSessionBtn(_ sender: UIButton) {
        NetworkSelector.shared.currentNetwrokService = URLSessionNetworkServices()
        
    }
    
    @IBAction private func AlamofireBtn(_ sender: UIButton) {
        NetworkSelector.shared.currentNetwrokService = AlamofireNetworkServices()
    }
}

