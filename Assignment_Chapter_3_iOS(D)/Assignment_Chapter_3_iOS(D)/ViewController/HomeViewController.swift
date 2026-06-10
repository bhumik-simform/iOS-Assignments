//
//  HomeViewController.swift
//  Assignment_Chapter_3_iOS(D)
//
//  Created by Bhumik Poshiya on 08/04/26.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var countrySearchBar: UISearchBar!
    @IBOutlet weak var homeTableView: UITableView!
    
    private lazy var filteredDishes = allDishes
    var currentSearchText: String = ""
    
    var isSearchingText: Bool {
        !currentSearchText.isEmpty
    }
    
    var matchedCountries: [Country] { guard isSearchingText else { return [] }
        return allCountries.filter {
            $0.name.lowercased().hasPrefix( currentSearchText.lowercased() )
        }
    }
    
    var hasMatch: Bool {
        !matchedCountries.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }
}

extension HomeViewController {
    func applyFilters() {
        filteredDishes = allDishes.filter { dish in
            guard let countryName = dish.country?.name else { return false }
            let matchesSearch = currentSearchText.isEmpty || countryName.lowercased().hasPrefix( currentSearchText.lowercased() )
        
            
            return matchesSearch
        }
        
        homeTableView.reloadData()
    }
}

extension HomeViewController {
    func setupTable() {
        homeTableView.dataSource = self
        homeTableView.delegate = self
        
        //homeTableView.tableHeaderView = headerView
        
        homeTableView.register(
            UINib(nibName: "CountryCarouselTableViewCell", bundle: nil),
            forCellReuseIdentifier: "CountryCarouselTableViewCell"
        )
        
        homeTableView.register(
            UINib(nibName: "DishTableViewCell", bundle: nil),
            forCellReuseIdentifier: "DishTableViewCell")
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        currentSearchText = searchText
        applyFilters()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        currentSearchText = ""
        searchBar.text = ""
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
        
        applyFilters()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = true
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
}
extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            if isSearchingText {
                if hasMatch {
                    let count = matchedCountries.count
                    return count == 0 ? "1 Country Found" : "\(count) Countries Found"
                } else {
                    return "No country found"
                }
            } else {
               return "Avaiable Countries"
            }
        } else {
            if isSearchingText {
                let countryNames = matchedCountries.map { $0.name }.joined(separator: ", ")
                return hasMatch ? "Dishes from \(countryNames)" : "No Results Found"
            }
            return "World Cusines"
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return filteredDishes.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCarouselTableViewCell", for: indexPath) as? CountryCarouselTableViewCell else {
                return UITableViewCell()
            }
            let loadedCountries = isSearchingText && hasMatch ? matchedCountries : allCountries
            cell.configCell(with: loadedCountries,currentDishes: filteredDishes , isSearchingText, hasMatch)
            
            cell.clickCountryItem = { [weak self] selectedCountry in
                guard let destinationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AboutCountryViewController") as? AboutCountryViewController else {
                    return
                }
                destinationVC.country = selectedCountry
                let nav = UINavigationController(rootViewController: destinationVC)
                self?.present(nav, animated: true)
            }
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DishTableViewCell", for: indexPath) as? DishTableViewCell else {
                return UITableViewCell()
            }
            cell.loadCell(with: filteredDishes[indexPath.row], with: .selectable)
            return cell
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 150
        } else {
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let currentDish = filteredDishes[indexPath.row]
        if let dishDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DishDetailViewController") as? DishDetailViewController {
            dishDetailVC.mainDish = currentDish
            navigationController?.pushViewController(dishDetailVC, animated: true)
        }
    }
}
