//
//  ViewController.swift
//  CafeCollectionAlameh
//
//  Created by ROY ALAMEH on 9/12/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textFieldOutlet: UITextField!
    @IBOutlet weak var cartOutlet: UITextView!
    @IBOutlet weak var itemsOutlet: UITextView!
    @IBOutlet weak var informationOutlet: UILabel!
    @IBOutlet weak var passwordOutlet: UITextField!
    @IBOutlet weak var totalOutlet: UILabel!
    @IBOutlet weak var newItemOutlet: UITextField!
    @IBOutlet weak var newItemPriceOutlet: UITextField!
    @IBOutlet weak var nameButtonOutlet: UIButton!
    @IBOutlet weak var priceButtonOutlet: UIButton!
    
    
    var thePassword = "Masterful chicken"
    
    var itemDict = ["apple": 2.0, "pear": 1.0, "cheese": 3.0, "whipped cream": 5.0, "cheetos": 10.0]
    var cartList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldOutlet.delegate = self
        passwordOutlet.delegate = self
        newItemOutlet.delegate = self
        newItemPriceOutlet.delegate = self
        
        itemsOutlet.layer.masksToBounds = true
        itemsOutlet.layer.cornerRadius = 20
        informationOutlet.layer.masksToBounds = true
        informationOutlet.layer.cornerRadius = 20
        cartOutlet.layer.masksToBounds = true
        cartOutlet.layer.cornerRadius = 20
        nameButtonOutlet.layer.masksToBounds = true
        nameButtonOutlet.layer.cornerRadius = 20
        priceButtonOutlet.layer.masksToBounds = true
        priceButtonOutlet.layer.cornerRadius = 20
        
        
        
        sortByName()
        
    }
    
    
    @IBAction func nameButton(_ sender: UIButton) {
        sortByName()
    }
    @IBAction func priceButton(_ sender: UIButton) {
        sortByPrice()
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textFieldOutlet.isFirstResponder {
            addItem()
            print("test1")
        }
        else {
            print("test")
            password()
        }
        textFieldOutlet.resignFirstResponder()
        passwordOutlet.resignFirstResponder()
        newItemOutlet.resignFirstResponder()
        newItemPriceOutlet.resignFirstResponder()
        
        return true
    }
    
    func addItem() {
        sortByName()
        let text = textFieldOutlet.text!
        textFieldOutlet.text = ""
        if itemDict[text] != nil {
            cartList.append(text)
            informationOutlet.text = "Item \"\(text)\" successfully added to cart"
            printItems()
        }
        else {
            informationOutlet.text = "Please type in a listed item"
        }
        
    }
    
    func password() {
        let text = passwordOutlet.text!
        if (text == thePassword) {
            if let test = Double(newItemPriceOutlet.text!) {
                if (newItemOutlet.text != "") {
                    itemDict[newItemOutlet.text!] = test
                    sortByName()
                    informationOutlet.text = "Item \(newItemOutlet.text!) successfully added"
                }
                else {
                    informationOutlet.text = "Enter a non-empty name and re-enter password"
                }
            }
            else {
                informationOutlet.text = "Enter a price (decimal) and re-enter password"
            }
        }
        else {
            informationOutlet.text = "Password incorrect"
        }
        
    }
    
    func sortByName() {
        var names = [String]()
        for (name, _) in itemDict {
            names.append(name)
        }
        names.sort()
        var text = ""
        var first = true
        for name in names {
            if (!first) {
                text += "\n"
            }
            text += "•\(name): $\(itemDict[name]!)"
            first = false
        }
        itemsOutlet.text = text
    }
    
    func sortByPrice() {
        var values = [Double]()
        var valuesDict = [Double: String]()
        for (name, value) in itemDict {
            values.append(value)
            valuesDict[value] = name
        }
        values.sort()
        var text = ""
        var first = true
        for value in values {
            if (!first){
                text += "\n"
            }
            text += "•\(valuesDict[value]!): $\(value)"
            first = false
        }
        itemsOutlet.text = text
    }
    
    func printItems() {
        print(cartList)
        var text = ""
        var total = 0.0;
        var first = true
        for itemName in cartList {
            if (!first) {
                text += "\n"
            }
            text += "•\(itemName): $\(itemDict[itemName]!)"
            total += itemDict[itemName]!
            first = false
        }
        cartOutlet.text = text
        totalOutlet.text = "$\(total)"
    }
}

