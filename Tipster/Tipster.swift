//
//  Tipster.swift
//  Tipster
//
//  Created by admin on 13/12/2021.
//

import Foundation

class Tipster {
    var totalNumber = "0.0"
    var isCleared = true
    var isDot = false
    
    let tip = Tip()

    func add(number num: Int) {
        if isCleared {
            totalNumber = "\(num)"
            isCleared = false
        }
        else {
            totalNumber += "\(num)"
        }
    }
    
    func clear() {
        totalNumber = "0.0"
        isCleared = true
        isDot = false
        }
    
    func addDot() {
        if !isDot && !isCleared {
            totalNumber += "."
            isDot = true
        }
    }
    
    func updateTip() {
        tip.setTip(total: Double(totalNumber)!)
    }
        
}

class Tip {
    private var initialTotal = 0.0
    var initialRate = 0
    var groupSize = 1
    
    var rates = [0, 0, 0]
    var amounts = [0.0 , 0.0, 0.0]
    var totals = [0.0, 0.0, 0.0]
    
    func setTip(total: Double) {
        initialTotal = total
        setTipRates()
    }
    
    private func setTipRates() {
        setrates()
        setAmounts()
        setTotals()
    }
    
    private func setrates() {
        rates[0] = initialRate
        rates[1] = initialRate + 5
        rates[2] = initialRate + 10
    }
    
    private func setAmounts() {
        amounts[0] = getAmount(rates[0])
        amounts[1] = getAmount(rates[1])
        amounts[2] = getAmount(rates[2])
    }
    
    private func setTotals() {
        var temp = (initialTotal/Double(groupSize))
        totals[0] = temp + amounts[0]
        totals[1] = temp + amounts[1]
        totals[2] = temp + amounts[2]
    }
    
    private func getAmount(_ rate: Int) -> Double{
        return (initialTotal * (Double(rate) / 100)) / Double(groupSize)
    }
    
}
