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
        
        printDictionary()
        
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
        printDictionary()
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
                    printDictionary()
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
    
    func printDictionary() {
        var text = ""
        for (itemName,price) in itemDict {
            text += "\n•\(itemName): $\(price)"
        }
        itemsOutlet.text = text
    }
    
    func printItems() {
        print(cartList)
        var text = ""
        var total = 0.0;
        for itemName in cartList {
            text += "\n•\(itemName): $\(itemDict[itemName]!)"
            total += itemDict[itemName]!
        }
        cartOutlet.text = text
        totalOutlet.text = "$\(total)"
    }
}

