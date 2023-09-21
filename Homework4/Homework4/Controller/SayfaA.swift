//
//  SayfaA.swift
//  Homework4
//
//  Created by Utku Çetinkaya on 18.09.2023.
//

import UIKit

class SayfaA: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func destBButton(_ sender: Any) {
        performSegue(withIdentifier: "destBSegue", sender: nil)
    }
    
}
