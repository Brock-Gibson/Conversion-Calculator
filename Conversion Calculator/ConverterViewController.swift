//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Brock Gibson on 10/21/18.
//  Copyright © 2018 Brock Gibson. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {    
    
    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    var converter: [Converter]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        converter = [Converter(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C"),
                                      Converter(label: "celcius to fahrenheit", inputUnit: "°C", outputUnit: "°F"),
                                      Converter(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"),
                                      Converter(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi")]

        inputDisplay.text = converter![1].inputUnit
        outputDisplay.text = converter![1].outputUnit
        
    }

    @IBAction func changeConverter(_ sender: Any) {
        let alert = UIAlertController(title: "Choose Converter", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        alert.addAction(UIAlertAction(title: self.converter![0].label, style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            self.inputDisplay.text = self.converter![0].inputUnit
            self.outputDisplay.text = self.converter![0].outputUnit
        }))
        
        alert.addAction(UIAlertAction(title: self.converter![1].label, style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            self.inputDisplay.text = self.converter![1].inputUnit
            self.outputDisplay.text = self.converter![1].outputUnit
        }))
        
        alert.addAction(UIAlertAction(title: self.converter![2].label, style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            self.inputDisplay.text = self.converter![2].inputUnit
            self.outputDisplay.text = self.converter![2].outputUnit
        }))
        
        alert.addAction(UIAlertAction(title: self.converter![3].label, style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            self.inputDisplay.text = self.converter![3].inputUnit
            self.outputDisplay.text = self.converter![3].outputUnit
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}
