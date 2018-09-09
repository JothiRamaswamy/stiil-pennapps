//
//  AddViewController.swift
//  pennapps
//
//  Created by Jothi Ramaswamy on 9/8/18.
//  Copyright © 2018 Jothi Ramaswamy. All rights reserved.
//

import UIKit
import Charts
import DocuSignSDK

class AddViewController: UIViewController {

    @IBOutlet weak var datePcr: UIDatePicker!
    @IBAction func addBtn(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Are you sure?", message: "If you add this event, you cannot delete in the future. Are you sure you want to add it?", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "Yes", style: .default) { (action:UIAlertAction) in
            self.added();
            
        }
        let action2 = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction) in
            print("You've pressed the destructive");
            
        }
        alertController.addAction(action1)
        alertController.addAction(action2)
        present(alertController, animated: true, completion: nil)
        
    }
    
    func added() {
        
        var e = UserDefaults.standard.array(forKey: "added")
        if e == nil {
            e = []
        }

        
        
        let component = Calendar.current.component(.month, from: datePcr.date)
        let now = Calendar.current.component(.month, from: Date())
        e?.append(now-component)
        UserDefaults.standard.set(e!, forKey: "added")
        print(e!)
        let alertController = UIAlertController(title: "Added!", message: "Your event has now been added to your record. Go to home to check your progress!", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Dismiss", style: .default) { (action:UIAlertAction) in
            print("You've pressed the destructive");
            
        }
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBOutlet weak var descriptionView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        descriptionView.layer.borderColor = UIColor.white.cgColor
        descriptionView.layer.borderWidth = 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "Add" {
//            let destination = segue.destination as! AddViewController
//            destination.hidesBottomBarWhenPushed = true
//        }
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
