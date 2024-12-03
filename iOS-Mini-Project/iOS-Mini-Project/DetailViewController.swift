//
//  DetailViewController.swift
//  iOS-Mini-Project
//
//  Created by Alfadli Maulana Siddik on 03/12/24.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        // Do any additional setup after loading the view.
    }

    // MARK: - Navigation
     @objc func goBack() {
         navigationController?.popViewController(animated: true)
     }

}
