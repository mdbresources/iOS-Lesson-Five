//
//  ViewController.swift
//  lesson5demo
//
//  Created by Anmol Parande on 3/5/20.
//  Copyright © 2020 Anmol Parande. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var locationLabel: UILabel!
    
    var dataManager: DataManager!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.dataManager = DataManager()
    }
    @IBAction func startUpdatingLocation(_ sender: Any) {
        self.dataManager.locationManager.beginListening()
    }
    
    @IBAction func endUpdatingLocation(_ sender: Any) {
        self.dataManager.locationManager.stopListening()
    }
}

