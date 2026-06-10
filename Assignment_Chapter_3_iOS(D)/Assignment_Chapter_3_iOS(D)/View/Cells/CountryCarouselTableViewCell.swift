//
//  CountryCarouselTableViewCell.swift
//  Assignment_Chapter_3_iOS(D)
//
//  Created by Bhumik Poshiya on 08/04/26.
//

import UIKit

class CountryCarouselTableViewCell: UITableViewCell {

    @IBOutlet weak var countryCollectionView: UICollectionView!
    
    var clickCountryItem: ((Country)->Void)?
    
    private var countries: [Country] = []
    private var currentDishes: [Dish] = []
    private var isSearchingText: Bool = false
    private var hasMatch: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        countryCollectionView.dataSource = self
        countryCollectionView.delegate = self
        
        countryCollectionView.register(
            UINib(nibName: "CountryCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: "CountryCollectionViewCell"
        )
    }
}

extension CountryCarouselTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CountryCollectionViewCell", for: indexPath) as? CountryCollectionViewCell else {
                return UICollectionViewCell()
            }
            
        let currentCountry = countries[indexPath.item]
            cell.loadCountryCell(with: currentCountry)
            cell.dishCountLbl.text = "\(currentCountry.dishCount(from: currentDishes)) Dishes"
            return cell
        }
}

extension CountryCarouselTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalWidth = UIScreen.main.bounds.width
        let padding: CGFloat = 8
        
        let cardHeight = ((totalWidth - (padding * 3.5)) / 3.5) * 1.2
        
        let cardWidth: CGFloat = {
            if hasMatch && isSearchingText {
                if countries.count == 1 {
                    return collectionView.frame.width
                } else {
                    return (totalWidth - (padding * 1.5)) / 1.5
                }
            } else {
                return (totalWidth - (padding * 3.5)) / 3.5
            }
        } ()
        return CGSize(width: cardWidth, height: cardHeight )
    }
}

extension CountryCarouselTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        clickCountryItem?(allCountries[indexPath.item])
    }
}

extension CountryCarouselTableViewCell {
    func configCell(with countries: [Country], currentDishes: [Dish], _ isSearchingText:Bool, _ hasMatch: Bool) {
        self.countries = countries
        self.currentDishes = currentDishes
        self.isSearchingText = isSearchingText
        self.hasMatch = hasMatch
        countryCollectionView.reloadData()
    }
}
