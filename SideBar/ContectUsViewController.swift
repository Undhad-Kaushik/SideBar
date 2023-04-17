//
//  ContectUsViewController.swift
//  SideBar
//
//  Created by undhad kaushik on 11/04/23.
//

import UIKit

class ContectUsViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var manuBarButton: UIBarButtonItem!

    // MARK: - Life Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - If Condition Most Importent
        if self.revealViewController() != nil {
            manuBarButton.target = self.revealViewController()
            manuBarButton.action = #selector(self.revealViewController().revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
}
