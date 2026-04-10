//
//  CountryCardCollectionViewCell.swift
//  Assignment_Chapter_3_iOS(C)
//
//  Created by Bhumik Poshiya on 31/03/26.
//

import UIKit

class CountryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var emojiILbl: UILabel!
    @IBOutlet weak var countryNameLbl: UILabel!
    @IBOutlet weak var dishCountLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadCountryCell(with country: Country) {
        self.emojiILbl.text = country.flagEmoji
        self.countryNameLbl.text = country.name
        self.backgroundColor = country.color
        self.layer.cornerRadius = 14
        self.clipsToBounds = true
    }

}
