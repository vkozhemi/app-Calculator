//
//  ViewController.swift
//  D00
//
//  Created by Volodymyr KOZHEMIAKIN on 1/14/19.
//  Copyright © 2019 Volodymyr KOZHEMIAKIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberFromScreen:Int = 0;
    var firstNum:Int = 0;
    var operation:Int = 0;
    var mathSign:Bool = false;
    var digitCheck:Bool = false;
    
    
    @IBAction func neg(_ sender: UIButton) {
        if sender.tag == 11 {//neg
            if result.text != "ERROR" && result.text != "OVERFLOW" {
                result.text = String(Int(result.text!)! * (-1))
                numberFromScreen = Int(result.text!)!
            }
        }
    }
    
    
    @IBOutlet weak var result: UILabel!
    
    @IBAction func digits(_ sender: UIButton) {
        if mathSign == true {
            result.text = String(sender.tag)
            mathSign = false;
        }
        else {
            if result.text == "ERROR" || result.text == "OVERFLOW" || result.text == "0" {
                result.text = String(sender.tag)
            }
            else {
                if digitCheck == true {
                    result.text = String(sender.tag)
                    digitCheck = false
                }
                else {
                    result.text = result.text! + String(sender.tag)
                    result.text = checkOverflow(result: Int(result.text!)!)
                }
            }
        }
        if let num = result.text, let gg = Int(num){
            numberFromScreen = gg
        }
    }
    
    func checkOverflow(result:Int) -> String {
        //2147483647 -2147483648
        if result > 999999999 || result < -999999999 {
            return "OVERFLOW";
        }
        return String(result)
    }
    
//    func checkOverflow(result:String) -> String {
//        //2147483647 -2147483648
//        let res = Int(result)
//        if res! > 999999999 || res! < -999999999 {
//            return "OVERFLOW";
//        }
//        return String(res!)
//    }
    func checkOverflow2(result:Int) -> (Int, Bool) {
        //2147483647 -2147483648
        if result > 999999999 || result < -999999999 {
            return (0, true);
        }
        return (Int(result), false)
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if result.text != "" && sender.tag != 10 && sender.tag != 17 {
            if let num1 = result.text, let ggg = Int(num1){
                firstNum = ggg
            }
            if sender.tag == 13 {// /
                result.text = "/";
            }
            else if sender.tag == 14 {// *
                result.text = "*";
            }
            else if sender.tag == 15 {// -
                result.text = "-";
            }
            else if sender.tag == 16 {// +
                result.text = "+";
            }
            operation = sender.tag
            mathSign = true;
        }
        else if sender.tag == 17 { // calc
            digitCheck = true;
            if operation == 13 {
                if numberFromScreen == 0 {
                    result.text = "ERROR"
                    firstNum = 0
                    operation = 0
                }
                else {
                    let a = checkOverflow2(result: firstNum / numberFromScreen)
                    if (a.1 == false) {
                        result.text = String(a.0)
                    }
                    else {
                        result.text = "OVERFLOW"
                    }
                }
            }
            else if operation == 14 {
                let a = checkOverflow2(result: firstNum * numberFromScreen)
                if (a.1 == false) {
                    result.text = String(a.0)
                }
                else {
                    result.text = "OVERFLOW"
                }
            }
            else if operation == 15 {
                let a = checkOverflow2(result: firstNum - numberFromScreen)
                if (a.1 == false) {
                    result.text = String(a.0)
                }
                else {
                    result.text = "OVERFLOW"
                }
            }
            else if operation == 16 {
                let a = checkOverflow2(result: firstNum + numberFromScreen)
                if (a.1 == false) {
                    result.text = String(a.0)
                }
                else {
                    result.text = "OVERFLOW"
                }
            }
        }
        else if sender.tag == 10 {
            result.text = "0";
            firstNum = 0;
            numberFromScreen = 0;
            operation = 0;
        }
    }
    
    
    
    @IBOutlet weak var helloLabel: UILabel!
    @IBAction func clickButton(_ sender: UIButton) {
        print("Hello, bitch !")
        helloLabel.text = "Hello World !"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

