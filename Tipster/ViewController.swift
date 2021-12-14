//
//  ViewController.swift
//  Tipster
//
//  Created by admin on 13/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var lblTotal: UILabel!
    
    @IBOutlet weak var lblTitleRateLow: UILabel!
    @IBOutlet weak var lblTitleRateMed: UILabel!
    @IBOutlet weak var lblTitleRateHigh: UILabel!
    
    @IBOutlet weak var lblAmountRateLow: UILabel!
    @IBOutlet weak var lblAmountRateMed: UILabel!
    @IBOutlet weak var lblAmountRateHigh: UILabel!
    
    @IBOutlet weak var lblTotalRateLow: UILabel!
    @IBOutlet weak var lblTotalRateMed: UILabel!
    @IBOutlet weak var lblTotalRateHigh: UILabel!
    
    @IBOutlet weak var lblSizeSlider: UILabel!
    
    var tipster = Tipster()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func btnPressed(_ sender: UIButton) {
        switch sender.tag {
        case 10:
            tipster.addDot()
        case 11:
            tipster.clear()
        default:
            tipster.add(number: sender.tag)
        }
        updateUI()
    }
    
    @IBAction func tipSliderValueChanged(_ sender: UISlider) {
        tipster.tip.initialRate = Int(sender.value)
        updateUI()
    }
    
    @IBAction func sizeSliderValueChanged(_ sender: UISlider) {
        lblSizeSlider.text = "Group Size: \(Int(sender.value))"
        tipster.tip.groupSize = Int(sender.value)
        updateUI()
    }
    
    func updateUI() {
        tipster.updateTip()
        
        lblTotal.text = tipster.totalNumber
        
        lblTitleRateLow.text = "\(tipster.tip.rates[0])%"
        lblTitleRateMed.text = "\(tipster.tip.rates[1])%"
        lblTitleRateHigh.text = "\(tipster.tip.rates[2])%"

        
        lblAmountRateLow.text = String(format: "%.2f", tipster.tip.amounts[0])
        lblAmountRateMed.text = String(format: "%.2f", tipster.tip.amounts[1])
        lblAmountRateHigh.text = String(format: "%.2f", tipster.tip.amounts[2])
        
        lblTotalRateLow.text = String(format: "%.2f", tipster.tip.totals[0])
        lblTotalRateMed.text = String(format: "%.2f", tipster.tip.totals[1])
        lblTotalRateHigh.text = String(format: "%.2f", tipster.tip.totals[2])
    }
}

