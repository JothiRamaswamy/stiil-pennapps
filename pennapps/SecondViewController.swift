//
//  SecondViewController.swift
//  pennapps
//
//  Created by Jothi Ramaswamy on 9/7/18.
//  Copyright © 2018 Jothi Ramaswamy. All rights reserved.
//

import UIKit
import Charts

class SecondViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var emName: UITextField!
    @IBOutlet weak var emPhone: UITextField!
   
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    func isValidNumber(testStr:String) -> Bool {
        if testStr.count != 10 {
            return false
        }
        let num = Int(testStr)
        if num == nil {
            return false
        }
        else {
            return true
        }
    }

    @IBAction func save(_ sender: Any) {
        if (name.text == "" || phone.text == "" || email.text == "" || emName.text == "" || emPhone.text == ""){
            let alertController = UIAlertController(title: "Please Complete!", message: "You must complete all fields before saving",  preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .default) { (action:UIAlertAction) in
                print("");
                
            }
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
            
        } else if (!isValidEmail(testStr:email.text!)){
            
            let alertController = UIAlertController(title: "Email Invalid", message: "You must enter a valid email address",  preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .default) { (action:UIAlertAction) in
                print("");
                
            }
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
            
        } else if (!isValidNumber(testStr:phone.text!) || !isValidNumber(testStr: emPhone.text!)){
            
            let alertController = UIAlertController(title: "Phone Number Invalid", message: "You must enter a valid 10-digit phone number",  preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .default) { (action:UIAlertAction) in
                print("");
                
            }
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)

        }
        else {
            UserDefaults.standard.set(name.text!, forKey: "name")
            UserDefaults.standard.set(phone.text!, forKey: "phone")
            UserDefaults.standard.set(email.text!, forKey: "email")
            UserDefaults.standard.set(emName.text!, forKey: "emName")
            UserDefaults.standard.set(emPhone.text!, forKey: "emPhone")
            let alertController = UIAlertController(title: "Saved!", message: "Your profile is now saved.",  preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .default) { (action:UIAlertAction) in
                
            }
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    func getProfile() {
        guard (UserDefaults.standard.object(forKey: "name") as? String) != nil else {
            return
        }
        name.text = UserDefaults.standard.object(forKey: "name") as? String
        phone.text = UserDefaults.standard.object(forKey: "phone") as? String
        email.text = UserDefaults.standard.object(forKey: "email") as? String
        emName.text = UserDefaults.standard.object(forKey: "emName") as? String
        emPhone.text = UserDefaults.standard.object(forKey: "emPhone") as? String
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getProfile()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getProfile()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

