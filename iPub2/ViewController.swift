//
//  ViewController.swift
//  iPub2
//
//  Created by Avariceral on 3/12/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for index in 0..<Manager.shared.Brews.count {
            
            brewType[index].text = Manager.shared.Brews[index].name
            brewCountry[index].text = Manager.shared.Brews[index].country
            
            updateBrewAmount(for: index)
        }
    }


    @IBOutlet var brewType: [UILabel]!
    
    @IBOutlet var brewAmount: [UILabel]!
    
    @IBOutlet var brewCountry: [UILabel]!
    
    @IBOutlet weak var revenue: UILabel!
    
    @IBOutlet weak var brewSold: UILabel!

    @IBAction func startNewShift(_ sender: UIButton) {
        
        revenue.text = "Revenue: 0$"
        brewSold.text = "Beverage Sold: 0 L"
    
        Manager.shared.revenue = 0
        Manager.shared.brewSold = 0
        
        for index in 0..<Manager.shared.Brews.count{
            let randomD = Double(Int.random(in: 1...200))
            Manager.shared.Brews[index].amount = randomD
            print (Manager.shared.Brews[index].amount, "BRUHHH")
            brewAmount[index].text = "\(randomD) L"
        }
        
        print ("New Day")
    }

    
    @IBAction func buyBrew(_ sender: UIButton) {
        let brewIndex = sender.tag
        let brewNum = (brewIndex / 10) - 1
        let volume : Double
        print ("BrewNum", brewNum)
        
        switch brewIndex % 10 {
        case 0:
            volume = 0.33
        case 1:
            volume = 0.5
        case 2:
            volume = 1
        default:
            volume = 0
        }

        let price = Manager.shared.buyBrew(index: brewNum, volume: volume)
        
        updateRevenue(price: price)
    
        updateBrewAmount(for: brewNum)
        
        updateBrewSold()
        
        showAlert(price: price)
        
        
       
        print ("Brew: \(brewNum), \(volume) L")
    }
    
    func updateBrewAmount (for index: Int) {
        let volume = Manager.shared.Brews[index].amount
        
        brewAmount[index].text = "\(volume) L"
    }
    
    
    func updateRevenue (price: Double) {
        
        let newRevenue = Manager.shared.revenue
        revenue.text = "Revenue: \(newRevenue)$"
        
    }
    
    func updateBrewSold() {
        
        let newBrewSold = Manager.shared.brewSold
        brewSold.text = "Beverage Sold: \(newBrewSold) L"
        
    }
    
    
    
    
    
    func showAlert (price: Double) {
        
        if price < 0.01 {
            showAlert(with: "Bruh", message: "Item is Sold Out")
        }
        else {
            showAlert(with: "Successful", message: "Purchase Amount: \(price)$")
            
        }
        
    }
    
    func showAlert (with title: String, message: String) {
        
        let alert = UIAlertController (title: title,
                                       
                                       message: message,
                                       
                                       preferredStyle: .alert)
        
        let action = UIAlertAction (title: title,
                                    style: .default)
        alert.addAction(action)
        self.present(alert, animated: true)
                                    
        
    }
    
}


