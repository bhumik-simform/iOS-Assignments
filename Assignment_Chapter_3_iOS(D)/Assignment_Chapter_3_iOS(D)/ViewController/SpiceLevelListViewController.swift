//
//  SpiceLevelListViewController.swift
//  Assignment_Chapter_3_iOS(D)
//
//  Created by Bhumik Poshiya on 10/04/26.
//

import UIKit

class SpiceLevelListViewController: UIViewController {

    @IBOutlet weak var spiceLvlTableView: UITableView!
    
    var spiceLvl: SpiceLevel?
    private var filteredDishes = allDishes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        guard let spiceLvl else { return }
        self.title = spiceLvl != .none ? "\(spiceLvl.label) Dishes" : "None Spice Dishes"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Home",
            style: .plain,
            target: self,
            action: #selector(didHomeBtnClick)
        )
        
        filteredDishes = allDishes.filter {
            $0.spiceLevel == spiceLvl
        }
        setupTable()
    }
    
    func setupTable() {
        spiceLvlTableView.register(
            UINib(nibName: "DishTableViewCell", bundle: nil),
            forCellReuseIdentifier: "DishTableViewCell"
        )
        
        spiceLvlTableView.dataSource = self
    }
    
    @objc func didHomeBtnClick() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension SpiceLevelListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredDishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DishTableViewCell", for: indexPath) as? DishTableViewCell else {
            return UITableViewCell()
        }
        cell.loadCell(with: filteredDishes[indexPath.row], with: .normal)
        return cell
    }
}
