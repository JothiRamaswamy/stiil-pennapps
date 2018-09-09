//
//  SecondViewController.swift
//  pennapps
//
//  Created by Jothi Ramaswamy on 9/7/18.
//  Copyright © 2018 Jothi Ramaswamy. All rights reserved.
//

import UIKit
import Charts
import DocuSignSDK

class SecondViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var zip: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var emName: UITextField!
    @IBOutlet weak var emPhone: UITextField!
    @IBOutlet weak var medName: UITextField!
    @IBOutlet weak var medPhone: UITextField!
    @IBOutlet weak var medEmail: UITextField!

    @IBAction func save(_ sender: Any) {
        if (name.text == "" || phone.text == "" || address.text == "" || city.text == "" || state.text == "" || zip.text == "" || email.text == "" || emName.text == "" || emPhone.text == "" || medName.text == "" || medPhone.text == "" || medEmail.text == ""){
            let alertController = UIAlertController(title: "Please Complete!", message: "You must complete all fields before saving",  preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .default) { (action:UIAlertAction) in
                print("");
                
            }
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }
        else {
            UserDefaults.standard.set(name.text!, forKey: "name")
            UserDefaults.standard.set(phone.text!, forKey: "phone")
            UserDefaults.standard.set(address.text!, forKey: "address")
            UserDefaults.standard.set(city.text!, forKey: "city")
            UserDefaults.standard.set(state.text!, forKey: "state")
            UserDefaults.standard.set(zip.text!, forKey: "zip")
            UserDefaults.standard.set(email.text!, forKey: "email")
            UserDefaults.standard.set(emName.text!, forKey: "emName")
            UserDefaults.standard.set(emPhone.text!, forKey: "emPhone")
            UserDefaults.standard.set(medName.text!, forKey: "medName")
            UserDefaults.standard.set(medPhone.text!, forKey: "medPhone")
            UserDefaults.standard.set(medEmail.text!, forKey: "medEmail")
            let alertController = UIAlertController(title: "Saved!", message: "Your profile is now saved.",  preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .default) { (action:UIAlertAction) in
                print("");
                
            }
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    func getProfile() {
        guard let n = UserDefaults.standard.object(forKey: "name") as? String else {
            return
        }
        if n != nil {
            name.text = UserDefaults.standard.object(forKey: "name") as? String
            phone.text = UserDefaults.standard.object(forKey: "phone") as? String
            address.text = UserDefaults.standard.object(forKey: "address") as? String
            city.text = UserDefaults.standard.object(forKey: "city") as? String
            state.text = UserDefaults.standard.object(forKey: "state") as? String
            zip.text = UserDefaults.standard.object(forKey: "zip") as? String
            email.text = UserDefaults.standard.object(forKey: "email") as? String
            emName.text = UserDefaults.standard.object(forKey: "emName") as? String
            emPhone.text = UserDefaults.standard.object(forKey: "emPhone") as? String
            medName.text = UserDefaults.standard.object(forKey: "medName") as? String
            medPhone.text = UserDefaults.standard.object(forKey: "medPhone") as? String
            medEmail.text = UserDefaults.standard.object(forKey: "medEmail") as? String
        }
        
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

