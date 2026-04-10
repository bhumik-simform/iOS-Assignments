//
//  CountryViewController.swift
//  Assignment_Chapter_3_iOS(D)
//
//  Created by Bhumik Poshiya on 09/04/26.
//

import UIKit

class AboutCountryViewController: UIViewController {

    var country: Country?
    @IBOutlet weak var countryBGView: UIView!
    
    @IBOutlet weak var countryFlagLbl: UILabel!
    @IBOutlet weak var countryNameLbl: UILabel!
    @IBOutlet weak var countryCusineLbl: UILabel!
    
    @IBOutlet weak var avgRatingLbl: UILabel!
    @IBOutlet weak var avgKcalLbl: UILabel!
    @IBOutlet weak var dishCountLbl: UILabel!
    
    @IBOutlet weak var decriptionOuterView: UIView!
    @IBOutlet weak var descriptionTitleLbl: UILabel!
    @IBOutlet weak var countryDescriptionLbl: UILabel!
    
    @IBOutlet weak var othDishesTitleLbl: UILabel!
    
    @IBOutlet weak var dish1OuterView:UIView!
    @IBOutlet weak var dish1EmojiLbl: UILabel!
    @IBOutlet weak var dish1NameLbl: UILabel!
    
    @IBOutlet weak var dish2OuterView:UIView!
    @IBOutlet weak var dish2EmojiLbl: UILabel!
    @IBOutlet weak var dish2NameLbl: UILabel!
    
    @IBOutlet weak var dish3OuterView:UIView!
    @IBOutlet weak var dish3EmojiLbl: UILabel!
    @IBOutlet weak var dish3NameLbl: UILabel!
    
    @IBOutlet weak var dish4OuterView:UIView!
    @IBOutlet weak var dish4EmojiLbl: UILabel!
    @IBOutlet weak var dish4NameLbl: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNavigationBar()
        loadCountryData()
    }
    
    private func loadNavigationBar() {
        self.title = country?.name ?? "Unknow"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Home",
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(didHomeBtnClick)
                                                )
    }
    
    @objc func didHomeBtnClick() {
        self.navigationController?.dismiss(animated: true)
    }
    
    
    private func loadCountryData() {
        
        guard let country else {
            return
        }
        
        self.countryBGView.backgroundColor = country.color.withAlphaComponent(0.5)
        self.countryBGView.layer.cornerRadius = 14
        
        self.countryFlagLbl.text = country.flagEmoji
        self.countryNameLbl.text = country.name
        self.countryCusineLbl.text = country.cuisineStyle
        
        self.dishCountLbl.text = String(country.dishCount())
        
        let avgRating = (country.dishes().reduce(0) { $0 + $1.rating }) / Double(country.dishCount())
        self.avgRatingLbl.text = String( (avgRating * 10).rounded() / 10)
        
        let avgKcal = (country.dishes().reduce(0) { $0 + $1.calories }) / country.dishCount()
        self.avgKcalLbl.text = String(avgKcal)
        
        self.decriptionOuterView.layer.cornerRadius = 14
        self.descriptionTitleLbl.text = "Other Cusines of \(country.name)"
        self.countryDescriptionLbl.text = country.description
        
        self.othDishesTitleLbl.text = "Other Cusines of \(country.name)"
        
        self.dish1OuterView.backgroundColor = country.color.withAlphaComponent(0.5)
        self.dish1OuterView.layer.cornerRadius = 14
        self.dish1EmojiLbl.text = country.dishes()[0].emoji
        self.dish1NameLbl.text = country.dishes()[0].name
        
        self.dish2OuterView.backgroundColor = country.color.withAlphaComponent(0.5)
        self.dish2OuterView.layer.cornerRadius = 14
        self.dish2EmojiLbl.text = country.dishes()[1].emoji
        self.dish2NameLbl.text = country.dishes()[1].name
        
        self.dish3OuterView.backgroundColor = country.color.withAlphaComponent(0.5)
        self.dish3OuterView.layer.cornerRadius = 14
        self.dish3EmojiLbl.text = country.dishes()[2].emoji
        self.dish3NameLbl.text = country.dishes()[2].name
        
        self.dish4OuterView.backgroundColor = country.color.withAlphaComponent(0.5)
        self.dish4OuterView.layer.cornerRadius = 14
        self.dish4EmojiLbl.text = country.dishes()[3].emoji
        self.dish4NameLbl.text = country.dishes()[3].name

    }
}
