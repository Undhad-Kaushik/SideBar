//
//  SideBarTableViewController.swift
//  SideBar
//
//  Created by undhad kaushik on 11/04/23.
//

import UIKit

struct Options {
    var name: String
    var image: String
}

class SideBarTableViewController: UITableViewController {
    
    // MARK: - Variabels & Outlets
    var arrOptions: [Options] = []
    var SelectedIndex: Int = 1
    
    // MARK: - Life Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Function Call
        loadOptions()
    }
    
    private func loadOptions(){
        let homeOptios: Options = Options(name: "Home", image: "fireplace")
        let aboutUsOptios: Options = Options(name: "About Us", image: "fireplace")
        let contectUsOptios: Options = Options(name: "Contect Us", image: "fireplace")
        
        arrOptions = [homeOptios,aboutUsOptios,contectUsOptios]
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    // MARK: - UItabelViewDelegate & Deta Source Method
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOptions.count
    }
    
    // MARK: - TabelView Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.text = arrOptions[indexPath.row].name
        cell.imageView?.image = UIImage(systemName: "fireplace")
        cell.selectionStyle = .none
        if SelectedIndex == indexPath.row {
            cell.textLabel?.textColor = .red
        } else {
            cell.textLabel?.textColor = .black
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SelectedIndex = indexPath.row
        tableView.reloadData()
        switch indexPath.row {
        case 0: performSegue(withIdentifier: "home", sender: nil)
        case 1: performSegue(withIdentifier: "aboutUs", sender: nil)
        case 2: performSegue(withIdentifier: "contactUs", sender: nil)
        default: performSegue(withIdentifier: "home", sender: nil)
            
        }
    }
}
