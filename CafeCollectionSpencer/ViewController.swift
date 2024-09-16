//
//  ViewController.swift
//  CafeCollectionSpencer
//
//  Created by RYAN SPENCER on 9/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    var foods: [String] = ["Chicken", "Fries", "Bagel", "Steak", "Taquitos"]
    var prices: [Double] = [9.99, 5.55, 3.99, 17.99, 8.88]
    var cart: [String:Int] = [:]
    var cost: Double = 0.0
    
    @IBOutlet weak var foodView: UITextView!
    
    @IBOutlet weak var priceView: UITextView!
    
    @IBOutlet weak var foodField: UITextField!
    
    @IBOutlet weak var cartView: UITextView!
    
    @IBOutlet weak var costView: UITextView!
    
    @IBOutlet weak var quantityField: UITextField!
    
    @IBOutlet weak var inputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        for i in 0..<foods.count{
            foodView.text += "\(foods[i])\n"
            priceView.text += "\(prices[i])\n"
        }
        
        cartView.text = "Cart:\n"
        
        inputLabel.text = ""
        
    }
    
    @IBAction func addCart(_ sender: Any) {
        
        for i in 0..<foods.count{
            if foods[i] == foodField.text! {
                if let quantity = Int(quantityField.text!) {
                    cartView.text += " \(foodField.text!) x\(quantity),"
                    cart[foodField.text!] = quantity
                    cost += (prices[i] * Double(quantity))
                    cost *= 100.0
                    cost = cost.rounded()
                    cost /= 100.0
                    inputLabel.textColor = UIColor.green
                    inputLabel.text = "Added to cart"
                    break
                } else {
                    inputLabel.textColor = UIColor.red
                    inputLabel.text = "Invalid quantity"
                }
            } else {
                inputLabel.textColor = UIColor.red
                inputLabel.text = "Invalid food item"
            }
        }
        
        costView.text = "Cost:\n$\(cost)"
        
    }
    

}

