//
//  HomeTabViewController.swift
//  Assignment_Chapter_3_iOS(C)
//
//  Created by Bhumik Poshiya on 31/03/26.
//
import Foundation
import UIKit

class HomeTabViewController: UIViewController {

    
    //IBOutLets
    @IBOutlet weak var countrySearchBar: UISearchBar!
    @IBOutlet weak var cusineTypeSegmentControl: UISegmentedControl!
    @IBOutlet weak var countryCardStepper: UIStepper!
    @IBOutlet weak var collectionResultsLbl: UILabel!
    @IBOutlet weak var countryCardCollection: UICollectionView!
    @IBOutlet weak var gridOrientationSwt: UISwitch!
    @IBOutlet weak var tableResultsLabel: UILabel!
    @IBOutlet weak var cusineTableView: UITableView!
    
    
    //State Variables
    lazy var filteredDishes = allDishes
    var currentSearchText: String = ""
    var currentDietFilter: DishType? = nil
    var hasSetCollectionHeight = false

    
    
    var isSearchingText: Bool {
        !currentSearchText.isEmpty
    }
    var matchedCountries: [Country] { guard isSearchingText else { return [] }
        return allCountries.filter {
            $0.name.lowercased().hasPrefix(currentSearchText.lowercased())
        }
    }
    var hasMatch: Bool {
        !matchedCountries.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupTableView()
        setupInitialUI()
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard !hasSetCollectionHeight else { return }
        hasSetCollectionHeight = true
    }
    //Filter data according to conditions
    func applyFilters() {
        filteredDishes = allDishes.filter { dish in
            // 1. Check text search
            let matchesSearch = currentSearchText.isEmpty ||
            dish.country.lowercased().hasPrefix(currentSearchText.lowercased())

            // 2. Check segment filter
            let matchesDiet = (currentDietFilter == nil) || (dish.type == currentDietFilter)
                        
            return matchesSearch && matchesDiet
        }

        countryCardCollection.reloadData()
        cusineTableView.reloadData()

        updateUI()
    }
    
    //Handles UI Part
    func updateUI() {
        
        //Handle searchbar according to senario
        countrySearchBar.showsCancelButton = isSearchingText
        
        //Shows and Hides countryCardStepper according searching feature is used or not
        countryCardStepper.isHidden = isSearchingText
        
        //Handle numberCusine Label According to result
        if isSearchingText {
            if hasMatch {
                let count = matchedCountries.count
                collectionResultsLbl.text = count == 1 ? "1 Country found" : "\(count) Countries found"
            } else {
                collectionResultsLbl.text = "No country found"
            }
            
        } else {
            let count = Int(countryCardStepper.value)
            collectionResultsLbl.text = count == 1 ? "1 Country Card shown" : "\(count) Country Cards shown"
        }
        
        //Handle tableResultsLabel according to search results
        if isSearchingText {
            if hasMatch {
                let countryNames = matchedCountries.map { $0.name }.joined(separator: ", ")
                tableResultsLabel.text = "Cusines form \(countryNames) "
            } else {
                tableResultsLabel.text = "No result Found"
            }
        } else {
            tableResultsLabel.text = "Popular Cusines"
        }
        
    }
    
   
    
    //Change Height of Collection view According to Screen Size
}

//All buttons Action
extension HomeTabViewController {
    
    //Handle Segment Control
    @IBAction func filterSegmentChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: currentDietFilter = nil // All
        case 1: currentDietFilter = .nonVeg
        case 2: currentDietFilter = .veg
        case 3: currentDietFilter = .vegan
        default: currentDietFilter = nil
        }
        applyFilters()
    }
    
    //Changes collection items accordin to stepper value
    @IBAction func countryCardStepperClick(_ sender: UIStepper) {
        countryCardCollection.reloadData()
        updateUI()
    }
    
    
    //Changes Orientations of Table View Cell According to Switch
    @IBAction func toggleOrientationSwitch (_ sender: UISwitch) {
        let isVertical = sender.isOn
        cusineTableView.visibleCells.forEach { cell in
            guard let newCell = cell as? CusineTableViewCell else { return }
            newCell.toggleOrientation(isVertical)
        }
        cusineTableView.reloadData()
    }
    
}

extension HomeTabViewController {
    func setupCollectionView() {
        countryCardCollection.register(
            UINib(nibName: "CountryCardCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: "CountryCardCollectionViewCell"
        )
        countryCardCollection.dataSource = self
        countryCardCollection.delegate   = self

    }

    func setupTableView() {
        cusineTableView.register(
            UINib(nibName: "CusineTableViewCell", bundle: nil),
            forCellReuseIdentifier: "CusineTableViewCell"
        )
        cusineTableView.dataSource = self
    }

    func setupInitialUI() {
        countryCardStepper.minimumValue = 1
        countryCardStepper.maximumValue = Double(allCountries.count)
        countryCardStepper.value        = 4
        countrySearchBar.delegate  = self
        countrySearchBar.showsCancelButton = false
        updateUI()
    }
}

//UISearchbar Delegate
extension HomeTabViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        currentSearchText = searchText
        applyFilters()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        //Reset All State
        currentSearchText = ""
        searchBar.text = ""
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
        
        applyFilters()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
}

//Collection View Data Source and Delegate Flow Layout
extension HomeTabViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = isSearchingText ?  (matchedCountries.count) : Int(countryCardStepper.value)
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CountryCardCollectionViewCell", for: indexPath) as? CountryCardCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let country: Country
        
        if isSearchingText && hasMatch {
            country = matchedCountries[indexPath.item]
            cell.emojiILbl.text = country.flagEmoji
        } else { // Default Collection view
            country = allCountries[indexPath.item]
            cell.emojiILbl.text = country.emoji
        }
        
        
        cell.countryNameLbl.text = country.name
        cell.dishCountLbl.text = "\(country.dishCount) Dishes"
        cell.backgroundColor = country.color
        cell.layer.cornerRadius = 14
        cell.clipsToBounds = true
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalWidth = UIScreen.main.bounds.width
        let padding: CGFloat = 8
        
        let numberOfCards: CGFloat = {
            if isSearchingText && hasMatch {
                return matchedCountries.count > 1 ? 1.5 : 1.0
            }
            return 3.5
        } ()
        let cardHeight = ((totalWidth - (padding * 3.5)) / 3.5) * 1.2
        let cardWidth = ((totalWidth - (padding * numberOfCards)) / numberOfCards)
        return CGSize(width: cardWidth, height: cardHeight )
    }
}


extension HomeTabViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredDishes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CusineTableViewCell", for: indexPath) as? CusineTableViewCell else {
                return UITableViewCell()
            }
        
        cell.loadCell(with: filteredDishes[indexPath.row], isVertical: gridOrientationSwt.isOn)
        return cell
    }
}

