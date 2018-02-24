//
//  ViewController.swift
//  Bracket
//
//  Created by Owner on 2/24/18.
//  Copyright © 2018 Owner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playerValueDisplay: UILabel!
    @IBOutlet weak var playerSliderValue: UISlider!
    @IBOutlet weak var teamsOnDisplay: UILabel!
    @IBOutlet weak var seedingOnDisplay: UILabel!
    @IBOutlet weak var teamButton: UISwitch!
    @IBOutlet weak var seedingButton: UISwitch!
    @IBOutlet weak var nextButton: UIButton!
    
    
    @IBAction func nextClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "firstSegue", sender: self)
    }
    @IBAction func playerSlidingDone(_ sender: UISlider) {
        if Int(playerSliderValue.value) > 1{
            playerValueDisplay.text = "\(Int(playerSliderValue.value)) PLAYERS"
        }
        else{
            playerValueDisplay.text = "\(Int(playerSliderValue.value)) PLAYER"
        }
        
        if playerSliderValue.value < 4{
            nextButton.isEnabled = false
            UIView.animate(withDuration: 0.6, animations: {
                    self.nextButton.alpha = 0.4
                })
        }
        else{
            nextButton.isEnabled = true
            UIView.animate(withDuration: 0.6, animations: {
                self.nextButton.alpha = 1
            })
        }
        
    }
    @IBAction func teamButtonClicked(_ sender: UISwitch) {
        if teamButton.isOn{
            UIView.animate(withDuration: 0.6, animations: {
                self.teamsOnDisplay.alpha = 1
            })
        }
        else{
            UIView.animate(withDuration: 0.6, animations: {
                self.teamsOnDisplay.alpha = 0.4
            })
        }
    }
    @IBAction func seedingButtonClicked(_ sender: UISwitch) {
        if seedingButton.isOn{
            UIView.animate(withDuration: 0.6, animations: {
                self.seedingOnDisplay.alpha = 1
            })
        }
        else{
            UIView.animate(withDuration: 0.6, animations: {
                self.seedingOnDisplay.alpha = 0.4
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isEnabled = false
        UIView.animate(withDuration: 0.6, animations: {
            self.nextButton.alpha = 0.4
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

