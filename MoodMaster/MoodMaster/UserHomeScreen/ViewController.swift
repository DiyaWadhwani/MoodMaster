//
//  ViewController.swift
//  MoodMaster
//
//  Created by Diya on 11/29/23.
//

import UIKit

class ViewController: UIViewController {
    
    let userHomeView = UserHomeView()
    
    override func loadView() {
        view = userHomeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

