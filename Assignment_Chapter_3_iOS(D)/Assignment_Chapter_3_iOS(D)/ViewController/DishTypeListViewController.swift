//
//  FilteredListViewController.swift
//  Assignment_Chapter_3_iOS(D)
//
//  Created by Bhumik Poshiya on 10/04/26.
//

import UIKit


class DishTypeListViewController: UIViewController {

    
    @IBOutlet weak var dishesTableView: UITableView!
    
    
    
    var dishType: DishType?
    private lazy var filteredDishes: [Dish] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
       
    }
    
    func setupUI() {
        guard let dishType else { return }
        
        self.title = "\(dishType.rawValue) Dishes"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Home",
            style: .plain,
            target: self,
            action: #selector(didHomeBtnClick)
        )
        
        filteredDishes = allDishes.filter {
            $0.type == dishType
        }
        setupTable()
    }

    func setupTable() {
        dishesTableView.register(
            UINib(nibName: "DishTableViewCell", bundle: nil),
            forCellReuseIdentifier: "DishTableViewCell")
        
        dishesTableView.dataSource = self
    }
    
    @objc func didHomeBtnClick() {
        self.navigationController?.popToRootViewController(animated: true)
    }

}

extension DishTypeListViewController: UITableViewDataSource {
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
