//
//  AddViewController.swift
//  pennapps
//
//  Created by Jothi Ramaswamy on 9/8/18.
//  Copyright © 2018 Jothi Ramaswamy. All rights reserved.
//

import UIKit
import Charts
import MessageUI

class AddViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var datePcr: UIDatePicker!
    
    func emailAsk() {
        
        let emailAlert = UIAlertController(title: "Email your information", message: "Do you want to email yourself the information you just entered?", preferredStyle: .alert)
        
        let yes = UIAlertAction(title: "Yes", style: .default) { (action:UIAlertAction) in
            self.sendEmail()
        }
        let no = UIAlertAction(title: "No thanks", style: .default) { (action:UIAlertAction) in
            
        }
        emailAlert.addAction(yes)
        emailAlert.addAction(no)
        present(emailAlert, animated: true, completion: nil)
        
    }
    
    func sendEmail() {
        let mailComposeVC = configureMailController()
        if MFMailComposeViewController.canSendMail(){
            self.present(mailComposeVC, animated: true, completion: nil)
        } else {
            emailError()
        }
    }
    
    func configureMailController() -> MFMailComposeViewController {
        
        var desc = descriptionView.text
        if desc == nil {
            desc = ""
        }
        
        
        let mailComposerVC = MFMailComposeViewController()
        
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["jothiramaswamy4@gmail.com"])
        
        mailComposerVC.setSubject("Event Added to Still!")
        
        mailComposerVC.setMessageBody(desc!, isHTML: false)
        
        return mailComposerVC
    }
    
    func emailError() {
        let sendMailErrorAlert = UIAlertController(title: "Cannot send email", message: "Your device cannot send emails", preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .default) { (action:UIAlertAction) in
            
        }
        
        sendMailErrorAlert.addAction(action)
        present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
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
        
        var month = UserDefaults.standard.array(forKey: "month")
        if month == nil {
            month = []
        }
        var year = UserDefaults.standard.array(forKey: "year")
        if year == nil {
            year = []
        }
        
        let m = Calendar.current.component(.month, from: datePcr.date)
        
        month?.append(m)
        UserDefaults.standard.set(month!, forKey: "month")
        print(month!)
        
        let y = Calendar.current.component(.year, from: datePcr.date)
        
        year?.append(y)
        UserDefaults.standard.set(year!, forKey: "year")
        print(year!)
        
        let alertController = UIAlertController(title: "Added!", message: "Your event has now been added to your record. Go to home to check your progress!", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Dismiss", style: .default) { (action:UIAlertAction) in
            self.descriptionView.text = ""
            self.datePcr.date = Date()
            self.emailAsk()
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
