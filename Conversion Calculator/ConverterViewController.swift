//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Brock Gibson on 10/21/18.
//  Copyright © 2018 Brock Gibson. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {    
    
    @IBOutlet weak var inputDisplay: UITextField!
    @IBOutlet weak var outputDisplay: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var converter: [Converter] = [Converter(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C"),
                                      Converter(label: "celcius to fahrenheit", inputUnit: "°C", outputUnit: "°F"),
                                      Converter(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"),
                                      Converter(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi")]

        inputDisplay.text = converter[1].inputUnit
        outputDisplay.text = converter[1].outputUnit
        
    }

    @IBAction func changeConverter(_ sender: Any) {
        print("triggered")
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
