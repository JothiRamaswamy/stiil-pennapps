//
//  FirstViewController.swift
//  pennapps
//
//  Created by Jothi Ramaswamy on 9/7/18.
//  Copyright © 2018 Jothi Ramaswamy. All rights reserved.
//

import UIKit
import Charts
import DocuSignSDK

class FirstViewController: UIViewController {

    @IBOutlet weak var lineChartView: LineChartView!
    @IBAction func sendBtn(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Sent!", message: "An email has been sent to ensure confidentiality of your information before your designated professional can access your data",  preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .default) { (action:UIAlertAction) in
            print("");
            
        }
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
        
    }
    
    func getData() -> [Int] {
        var final = [0,0,0,0,0,0,0,0,0,0,0,0]
        let events = UserDefaults.standard.array(forKey: "added")
        if events == nil {
            return final
        }
        for e in events! {
            var event = e as! Int
            if event < 0 {
                event += 12
            }
            if (11-event > -2){
                final[event-1] += 1
            }
        }
        return final;
    }
    
    func setChartValues(_ count: Int = 6) {
//        let values = (0..<count).map { (i) -> ChartDataEntry in
//            let val = Double(arc4random_uniform(UInt32(count)) + 3)
//            return ChartDataEntry(x: Double(i), y: val)
//        }
        let a = [1,2,3,4,5,6,7,8,9,10,11,12]
        let b = getData()
        
        var dataEntries : [ChartDataEntry] = []
        
        for index in 0..<b.count{
            let dataEntry = ChartDataEntry(x: Double(a[index]), y: Double(b[index]))
            dataEntries.append(dataEntry)
        }
        
        
        let set1 = LineChartDataSet(values: dataEntries, label: "null")
        let data = LineChartData(dataSet: set1)
        
        let color = NSUIColor(red: 0.122*4, green: 0.203*4, blue: 0.185*4, alpha: 1)
        
        set1.colors = [NSUIColor.lightGray]
        set1.circleColors = [color]
        self.lineChartView.data = data
        lineChartView.xAxis.labelPosition = .bottom
        lineChartView.dragEnabled = true
        lineChartView.setVisibleXRangeMaximum(5)
        self.lineChartView.legend.enabled = false
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        setChartValues()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print(getData())
        setChartValues()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

