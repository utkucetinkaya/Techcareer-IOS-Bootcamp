//
//  SayfaX.swift
//  Homework4
//
//  Created by Utku Çetinkaya on 18.09.2023.
//

import UIKit

class SayfaX: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func destYButton(_ sender: Any) {
        performSegue(withIdentifier: "destYSegue", sender: nil)
    }
}
