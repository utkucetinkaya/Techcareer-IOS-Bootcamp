//
//  ViewController.swift
//  Homework5
//
//  Created by Utku Çetinkaya on 20.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var historyLabel: UILabel!
    
    // MARK: - Variables
    
    var total: Double = 0
    var isTypingNumber = false
    var operation = ""
    var history: [(number: Double, operation: String)] = []

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    // MARK: - Func
    
    func updateHistory() {
        
        var historyString = ""
        
        for (number, operation) in history {
            historyString += "\(number) \(operation) "
        }
        
        historyLabel.text = historyString
    }
    
    // MARK: - IBActions
    
    // Numbers
    @IBAction func numbers(_ sender: UIButton) {
        
        let number = sender.currentTitle!
        if isTypingNumber {
            resultLabel.text = resultLabel.text! + number
        } else {
            resultLabel.text = number
            isTypingNumber = true
        }
    }
    
    // Addition
    @IBAction func addition(_ sender: Any) {
        operation = "+"
        total += Double(resultLabel.text ?? "") ?? 0
        
        isTypingNumber = false
        
        history.append((number: Double(resultLabel.text ?? "") ?? 0, operation: "+"))
        updateHistory()
    }
    
    // Clear
    @IBAction func clear(_ sender: UIButton) {
        total = 0
        isTypingNumber = false
        operation = ""
        resultLabel.text = "0"
        history.removeAll()
        historyLabel.text = "0"
        updateHistory()
    }
    
    // Equal
    @IBAction func equal(_ sender: UIButton) {
        
        if operation == "+" { 
            total += Double(resultLabel.text!)!
            if total == floor(total) {
                resultLabel.text = String(format: "%.0f", total)
           
            } else {
                resultLabel.text = String(format: "%g", total)
            }
            
            isTypingNumber = false
            total = 0
        }
    }
}
