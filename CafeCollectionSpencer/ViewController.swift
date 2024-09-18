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
    var adminbool: Bool = false
    
    @IBOutlet weak var exitAdminButton: UIButton!
    
    @IBOutlet weak var addCartButton: UIButton!
    
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
        
        if !adminbool {
            for (key, _) in cart {
                if key == foodField.text!{
                    inputLabel.textColor = UIColor.red
                    inputLabel.text = "Already in cart"
                    return
                }
            }
            
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
                        costView.text = "Cost:\n$\(cost)"
                        return
                    } else {
                        inputLabel.textColor = UIColor.red
                        inputLabel.text = "Invalid quantity"
                        return
                    }
                }
            }
            inputLabel.textColor = UIColor.red
            inputLabel.text = "Invalid food item"
            
        } else {
            for i in 0..<foods.count {
                if foodField.text! == foods[i] {
                    foods.remove(at: i)
                    prices.remove(at: i)
                    inputLabel.textColor = UIColor.green
                    inputLabel.text = "Item removed"
                    foodView.text = ""
                    priceView.text = ""
                    for i in 0..<foods.count{
                        foodView.text += "\(foods[i])\n"
                        priceView.text += "\(prices[i])\n"
                    }
                    return
                }
            }
            if let quantity = Double(quantityField.text!) {
                if foodField.text! != "" {
                    prices.append(quantity)
                    foods.append(foodField.text!)
                    inputLabel.textColor = UIColor.green
                    inputLabel.text = "Item added"
                    foodView.text = ""
                    priceView.text = ""
                    for i in 0..<foods.count{
                        foodView.text += "\(foods[i])\n"
                        priceView.text += "\(prices[i])\n"
                    }
                }
            } else {
                inputLabel.textColor = UIColor.red
                inputLabel.text = "Invalid price"
            }
        }
        
    }
    
    @IBAction func admin(_ sender: Any) {
        
        if(foodField.text! == "Password" || quantityField.text == "Password"){
            inputLabel.text = ""
            exitAdminButton.isHidden = false
            adminbool = true
            addCartButton.setTitle("Add/remove Item", for: .normal)
            quantityField.placeholder = "Insert price"
        } else {
            inputLabel.text = "Type password"
        }
        
    }
    
    @IBAction func exitAdmin(_ sender: Any) {
        
        exitAdminButton.isHidden = true
        adminbool = false
        addCartButton.setTitle("Add to Cart", for: .normal)
        inputLabel.text = ""
        quantityField.placeholder = "Insert quantity"
        
    }
    

}

