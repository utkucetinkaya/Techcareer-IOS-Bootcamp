//
//  ViewController.swift
//  Homework4
//
//  Created by Utku Çetinkaya on 18.09.2023.
//

import UIKit

class Anasayfa: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func destA(_ sender: Any) {
        performSegue(withIdentifier: "destASegue", sender: nil)
    }
    
    @IBAction func destX(_ sender: Any) {
        performSegue(withIdentifier: "destXSegue", sender: nil)
    }
}

