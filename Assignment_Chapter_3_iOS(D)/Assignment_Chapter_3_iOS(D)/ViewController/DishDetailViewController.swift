//
//  DishDetailViewController.swift
//  Assignment_Chapter_3_iOS(D)
//
//  Created by Bhumik Poshiya on 08/04/26.
//

import UIKit

class DishDetailViewController: UIViewController {

    @IBOutlet weak var emojiView: UIView!
    @IBOutlet weak var dishEmojiLabel: UILabel!
    @IBOutlet weak var dishNameLbl: UILabel!
    @IBOutlet weak var dishCountryLbl: UILabel!
    @IBOutlet weak var dietTypeOuterView: UIView!
    @IBOutlet weak var dietTypeBtn: UIButton!
    @IBOutlet weak var spiceTypeOuterView: UIView!
    @IBOutlet weak var spiceScaleBtn: UIButton!
    @IBOutlet weak var calorieCountLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var descriptionOuterView: UIView!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    var mainDish: Dish?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if mainDish != nil {
            loadNavigationBar()
            loadDetails()
        }
        // Do any additional setup after loading the view.
    }
    
    private func loadNavigationBar() {
        self.title = mainDish?.name
    }
    
    
    func loadDetails() {
        guard let mainDish else {
            return
        }
        self.emojiView.layer.cornerRadius = 14
        self.emojiView.backgroundColor = mainDish.color
        self.dishEmojiLabel.text = mainDish.emoji
        self.dishCountryLbl.text = mainDish.country?.name ?? "Unknow"
        self.dishNameLbl.text = mainDish.name
        
        self.dietTypeOuterView.backgroundColor = mainDish.type.colourCode().withAlphaComponent(0.2)
        self.dietTypeOuterView.layer.cornerRadius = 14
        self.dietTypeBtn.setTitle((mainDish.type.rawValue), for: .normal)
        self.dietTypeBtn.setTitleColor(mainDish.type.colourCode(), for: .normal)
        self.dietTypeBtn.setTitleColor(mainDish.type.colourCode(), for: .highlighted)
        
        self.spiceTypeOuterView.backgroundColor = mainDish.spiceLevel.badgeColor().withAlphaComponent(0.2)
        self.spiceTypeOuterView.layer.cornerRadius = 14
        let spiceLvlStr = "\(mainDish.spiceLevel.emoji) \(mainDish.spiceLevel.label)"
        self.spiceScaleBtn.setTitle(spiceLvlStr, for: .normal)
        self.spiceScaleBtn.setTitleColor(mainDish.spiceLevel.badgeColor(), for: .normal)
        self.spiceScaleBtn.setTitleColor(mainDish.spiceLevel.badgeColor(), for: .highlighted)
        
        self.calorieCountLbl.text = String(mainDish.calories)
        self.ratingLbl.text = String(mainDish.rating)
        
        self.descriptionOuterView.layer.cornerRadius = 14
        self.descriptionLbl.text = mainDish.description
    }
}

extension DishDetailViewController {
    @IBAction func didDietTypeBtnClk(_ sender: UIButton) {
        guard let destinationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DishTypeListViewController") as? DishTypeListViewController else {
            return
        }
        destinationVC.dishType = mainDish?.type
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @IBAction func didSpiceBtnClk(_ sender: UIButton) {
        guard let destinationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SpiceLevelListViewController") as? SpiceLevelListViewController else { return }
        destinationVC.spiceLvl = mainDish?.spiceLevel
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
}
