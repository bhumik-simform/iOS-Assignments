//
//  CusineTableViewCell.swift
//  Assignment_Chapter_3_iOS(C)
//
//  Created by Bhumik Poshiya on 01/04/26.
//

import UIKit

class CusineTableViewCell: UITableViewCell {

    @IBOutlet weak var emojiLbl: UILabel!
    @IBOutlet weak var emojiLblView: UIView!
    @IBOutlet weak var cusineLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var typeColourLbl: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var spiceLevelLbl: UILabel!
    @IBOutlet weak var outerStackView: UIStackView!
    @IBOutlet weak var emojiViewHeightConstrain: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        emojiLblView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadCell(with dish: Dish, isVertical: Bool) {
        toggleOrientation(isVertical)
        self.emojiLblView.backgroundColor = dish.color
        self.emojiLbl.text = dish.emoji
        self.cusineLabel.text = dish.name
        self.countryLabel.text = dish.country
        self.typeColourLbl.textColor = dish.type.colourCode()
        self.typeLabel.text = dish.type.rawValue
        self.spiceLevelLbl.text = dish.spiceLevel
    }
    
    func toggleOrientation(_ isVertical: Bool) {
        if isVertical {
            outerStackView.axis            = .vertical
            outerStackView.alignment       = .fill
        } else {
            outerStackView.axis            = .horizontal
            outerStackView.alignment       = .center
        }
    }
}
