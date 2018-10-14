//
//  FirstViewController.swift
//  pennapps
//
//  Created by Jothi Ramaswamy on 9/7/18.
//  Copyright © 2018 Jothi Ramaswamy. All rights reserved.
//

import UIKit
import Charts

class FirstViewController: UIViewController {
    
    var firstName = ""

    @IBOutlet weak var yAxis: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var subtitle: UILabel!
    
    func loadDates() -> [Int] {
        let months = UserDefaults.standard.array(forKey: "month") as? [Int]
        
        if months == nil {
            print("returned")
            return []
        }
        
        let years = UserDefaults.standard.array(forKey: "year") as! [Int]
        
        let count = years.count
        
        var events = [Int]()
        for i in 0..<count{
                    let monthNow = Calendar.current.component(.month, from: Date())
                    let yearNow = Calendar.current.component(.year, from: Date())
            if yearNow - years[i] == 1 {
                events.append(monthNow-months![i] + 12)
                    }
            else if years[i] == yearNow{
                events.append(monthNow-months![i])
                    }
        }
        //
        print(count)
        return events
    }

    func getData() -> [Int] {
        var final = [0,0,0,0,0,0,0,0,0,0,0,0]
        let events = loadDates()
        
        if events.count == 0 {
            return final
        }
        for e in events {
            var event = e
            if event < 0 {
                event += 12
            }
            if (11-event > -1){
                print(11-event)
                final[11-event] += 1
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
        self.lineChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values:["12","11","10","9","8","7","6","5","4","3","2", "1", "0"])
        self.lineChartView.leftAxis.axisMinimum = 0
        self.lineChartView.rightAxis.axisMinimum = 0
        self.lineChartView.leftAxis.axisMaximum = lineChartView.data!.yMax + 4.0
        self.lineChartView.rightAxis.axisMaximum = lineChartView.data!.yMax + 4.0
        self.lineChartView.xAxis.granularity = 1
        self.lineChartView.leftAxis.granularity = 1
        self.lineChartView.rightAxis.granularity = 1
        self.lineChartView.chartDescription?.text = ""
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        yAxis.transform = CGAffineTransform(rotationAngle: 3 * CGFloat.pi / 2)
        setChartValues()
        firstName = "there"
        guard let name = UserDefaults.standard.string(forKey: "name") else {
            print("there")
            return
        }
        
        let first = name.components(separatedBy: ",")
        if first.count == 1 {
            firstName = first[0]
        } else {
            firstName = first[1]
        }
        titleLabel.text = "Hello, \(firstName)!"
        titleLabel.adjustsFontSizeToFitWidth = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let name = UserDefaults.standard.string(forKey: "name") else {
            firstName = "there"
            return
        }
        let first = name.components(separatedBy: ",")
        if first.count == 1 {
            firstName = first[0]
        } else {
            firstName = first[1]
        }
        titleLabel.text = "Hello, \(firstName)!"
        titleLabel.adjustsFontSizeToFitWidth = true
        print(getData())
        setChartValues()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

