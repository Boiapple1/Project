//
//  ViewController.swift
//  CalculatorPro
//
//  Created by Consultant on 7/1/22.
// El % and =

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var operation: UILabel!
    
    @IBOutlet weak var Result: UILabel!
    
    var workings:String = ""
    var p:Int=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    func clearAll(){
        workings = ""
        operation.text = ""
        Result.text = ""
        p=0

    }
    
    @IBAction func ACT(_ sender: Any) {
        clearAll()
    }
    func addtoWorking(value:String){
        

        if workings != "" {
            let last = workings.last!
            
            if ((last == "-" || last == "+" || last == "*" || last == "/" || last == "=" || last == "%" || last == ".") && (value == "-" || value == "+" || value == "*" || value == "/" || value == "=" || value == "%"))
                {
                    workings.removeLast()
                }
            }
        
        
        if (value == "-" || value == "+" || value == "*" || value == "/" || value == "=" || value == "%")
        {
            p=0
        }
        
        
        if value == "."
        {
            if p == 0{
            if workings == ""{
            workings = workings+"0"+value
                p=1
            }else{
              
                let last = workings.last!
                if(last == "-" || last == "+" || last == "*" || last == "/" || last == "=" || last == "%" ) {
                    workings = workings+"0"+value
                    p=1
                }else{
                    workings = workings + value
                    p=1
                }
            
            }
            }
            
        }else
        {
            workings = workings+value
        }
        
        
        
        
        if workings == "0"{
            clearAll()
            operation.text = "0"

        }
        
        else if (workings == "+" || workings == "*" || workings == "/" || workings == "=" || workings == "%")
        {
            
            clearAll()
            
        }
        
        else{

        operation.text=workings
        }
        
        
        
    }

    
    @IBAction func negpos(_ sender: Any) {
        let op = operation.text?.prefix(1)
        if op != "0"{
        if op == "-"{
            let result = workings.replacingOccurrences(of: "-", with: "")
            workings = result
            operation.text = String(result)
        }else{
            operation.text = "-" + workings
            workings = "-"+workings
        }
        }else{
            addtoWorking(value: "0")
        }
    }
    @IBAction func percent(_ sender: Any) {
        addtoWorking(value: "%")
    }
    @IBAction func div(_ sender: Any) {
        
        addtoWorking(value: "/")
        
    }
    @IBAction func seven(_ sender: Any) {
        addtoWorking(value: "7")
    }
    @IBAction func eight(_ sender: Any) {
        addtoWorking(value: "8")
    }
    @IBAction func nine(_ sender: Any) {
        addtoWorking(value: "9")
    }
    @IBAction func multi(_ sender: Any) {
        addtoWorking(value: "*")
    }
    @IBAction func four(_ sender: Any) {
        addtoWorking(value: "4")
    }
    @IBAction func five(_ sender: Any) {
        addtoWorking(value: "5")
    }
    @IBAction func six(_ sender: Any) {
        addtoWorking(value: "6")
    }
    @IBAction func subtra(_ sender: Any) {
        addtoWorking(value: "-")
    }
    @IBAction func Three(_ sender: Any) {
        addtoWorking(value: "3")
    }
    @IBAction func Two(_ sender: Any) {
        addtoWorking(value: "2")
    }
    @IBAction func one(_ sender: Any) {
        addtoWorking(value: "1")
    }
    @IBAction func plus(_ sender: Any) {
        addtoWorking(value: "+")
    }
    @IBAction func zero(_ sender: Any) {
        addtoWorking(value: "0")
    }
    @IBAction func point(_ sender: Any) {
        addtoWorking(value: ".")
    }
    @IBAction func equal(_ sender: Any) {
        let last1 = workings.last!
        
        if workings != ""{
        if(last1 == "-" || last1 == "+" || last1 == "*" || last1 == "/" || last1 == "=" || last1 == "%" ){
            workings.removeLast()
            let indivi = workings.contains(".") ? "/" : ".00/"
            let workExpr2 = workings.replacingOccurrences(of: "%", with: "*.01*")
            
            let workExpr3 = workExpr2.replacingOccurrences(of: "/", with: indivi)
                
            let expression = NSExpression(format: workExpr3)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
                
            let resultString = formatResult(result: result)
            Result.text = resultString
            workings = resultString
        }
            else{
        let indivi = workings.contains(".") ? "/" : ".00/"
        let workExpr2 = workings.replacingOccurrences(of: "%", with: "*.01*")
        
        let workExpr3 = workExpr2.replacingOccurrences(of: "/", with: indivi)
            
        let expression = NSExpression(format: workExpr3)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
            
        let resultString = formatResult(result: result)
        Result.text = resultString
        workings = resultString
        

            }
            
        }
    
    else{
            clearAll()
        }
    }
    

    

    
    func formatResult(result: Double) -> String
    {
        if result.truncatingRemainder(dividingBy: 1) == 0{
            return String(format: "%.00f", result)
        }else{
            return String(format: "%.03f", result)

        }
    }
    
}

