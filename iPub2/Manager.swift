//
//  Manager.swift
//  iPub2
//
//  Created by Avariceral on 3/13/23.
//

import Foundation

class Manager {
    
    private init() {}
    static let shared = Manager()
    
    
    
    var Brews = [
    
        Brew(name: "Beer\n🍺", country: "🇩🇪", price: 8, amount: 200),
    
        Brew(name: "Wine\n🍷", country: "🇫🇷", price: 20, amount: 100),
        
        Brew(name: "Cider\n🥂", country: "🇮🇹", price: 15, amount: 150)
    ]
    /// проверить что остаток больше чем покупка, уменьшить остаток конкретного пива, подсчитать стоимость данного пива, увеличить кол-во проданного пива, увеличить течущую выручку, вернуть цену данного объема для данного пива
    var revenue = 0.0
    var brewSold = 0.0
    func buyBrew (index: Int, volume: Double) -> Double {
             
            if Brews[index].amount <= 0 {return 0}
             
            Brews[index].amount -= volume
            Brews[index].amount = round(Brews[index].amount)
            
             
            let price = Brews[index].price * volume
             
            brewSold += volume
            brewSold = round(brewSold)
             
            revenue += price
            revenue = round(revenue)
        
        print ("revenue:", revenue)
        print ("amount:",  Brews[index].amount)
             
            return round(price)
        }
   
    func round (_ num: Double) -> Double {
        
        var result = num * 100
        
        result += 0.5
        
        return (Double(Int(result)) / 100)
        
    }
}
