//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Brock Gibson on 10/21/18.
//  Copyright © 2018 Brock Gibson. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    
    var currentSelection:Int = 1
    var rawValue = ""
    var convertedValue = ""
    var plusMinus = ""
    var isNegative = false
    
    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    var converter: [Converter]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        converter = [Converter(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C"),
                                      Converter(label: "celcius to fahrenheit", inputUnit: "°C", outputUnit: "°F"),
                                      Converter(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"),
                                      Converter(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi")]

        updateConverterValues()
    }
    
    @IBAction func triggerPlusMinus(_ sender: Any) {
        isNegative = !isNegative
        if isNegative{
            plusMinus = "-"
        }else{
            plusMinus = ""
        }
        updateConverterValues()
    }
    
    @IBAction func clear(_ sender: Any) {
        rawValue = ""
        convertedValue = ""
        plusMinus = ""
        isNegative = false
        updateConverterValues()
    }
    
    @IBAction func appendToInput(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        if let btnChar = button.titleLabel?.text{
            rawValue = rawValue + btnChar
            updateConverterValues()
        }
    }
    
    @IBAction func changeConverter(_ sender: Any) {
        let alert = UIAlertController(title: "Choose Converter", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        alert.addAction(UIAlertAction(title: self.converter![0].label, style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            self.currentSelection = 0
            self.updateConverterValues()
        }))
        
        alert.addAction(UIAlertAction(title: self.converter![1].label, style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            self.currentSelection = 1
            self.updateConverterValues()
        }))
        
        alert.addAction(UIAlertAction(title: self.converter![2].label, style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            self.currentSelection = 2
            self.updateConverterValues()
        }))
        
        alert.addAction(UIAlertAction(title: self.converter![3].label, style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            self.currentSelection = 3
            self.updateConverterValues()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func updateConverterValues() {
        switch currentSelection {
        case 0:
            if let temp = Float(plusMinus+rawValue){
                let outcome = (temp-32)/1.8
                convertedValue = String(format: "%.2f", outcome)
            } else {
                convertedValue = ""
            }
            inputDisplay.text = plusMinus + rawValue + converter![currentSelection].inputUnit
            outputDisplay.text = convertedValue + converter![currentSelection].outputUnit
        case 1:
            if let temp = Float(plusMinus+rawValue){
                let outcome = (temp*1.8)+32
                convertedValue = String(format: "%.2f", outcome)
            } else {
                convertedValue = ""
            }
            inputDisplay.text = plusMinus + rawValue + converter![currentSelection].inputUnit
            outputDisplay.text = convertedValue + converter![currentSelection].outputUnit
        case 2:
            if let temp = Double(plusMinus+rawValue){
                let outcome = temp * 1.609344
                convertedValue = String(format: "%.2f", outcome)

            } else {
                convertedValue = ""
            }
            inputDisplay.text = plusMinus + rawValue + converter![currentSelection].inputUnit
            outputDisplay.text = convertedValue + converter![currentSelection].outputUnit
        case 3:
            if let temp = Float(plusMinus+rawValue){
                let outcome = temp / 1.609344
                convertedValue = String(format: "%.2f", outcome)
            } else {
                convertedValue = ""
            }
            inputDisplay.text = plusMinus + rawValue + converter![currentSelection].inputUnit
            outputDisplay.text = convertedValue + converter![currentSelection].outputUnit
        default:
            print("We hit the default case and definitely broke something!")
        }
    }
}
