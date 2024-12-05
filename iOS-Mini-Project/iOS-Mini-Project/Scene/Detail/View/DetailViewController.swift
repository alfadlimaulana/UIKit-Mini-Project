//
//  DetailViewController.swift
//  iOS-Mini-Project
//
//  Created by Alfadli Maulana Siddik on 03/12/24.
//

import UIKit

class DetailViewController: UIViewController {
    let vm: DetailViewControllerViewModel
    
    init(vm: DetailViewControllerViewModel) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
