//
//  ViewController.swift
//  Bracket
//
//  Created by Owner on 2/24/18.
//  Copyright © 2018 Owner. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    let bracketTypes = ["SINGLE ELIMINATION", "ROUND ROBIN", "DOUBLE ELIMINATION"]
    var selectedBracketType: String?
    
    @IBOutlet weak var playerValueDisplay: UILabel!
    @IBOutlet weak var playerSliderValue: UISlider!
    @IBOutlet weak var teamsOnDisplay: UILabel!
    @IBOutlet weak var seedingOnDisplay: UILabel!
    @IBOutlet weak var teamButton: UISwitch!
    @IBOutlet weak var seedingButton: UISwitch!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var blurEffect: UIVisualEffectView!
    @IBOutlet weak var bracketTypeTextField: UITextField!
    @IBOutlet weak var startButton: UIButton!

    
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
    @IBAction func clickedOffBracketType(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func createBracketPicker() {
        let bracketPicker = UIPickerView()
        bracketPicker.delegate = self
        bracketTypeTextField.inputView = bracketPicker
        bracketPicker.backgroundColor = UIColor(displayP3Red: 255, green: 126, blue: 121, alpha: 1)
    }
    @IBAction func startButtonClicked(_ sender: UIButton) {
        UIView.animate(withDuration: 1, animations: {
            self.blurEffect.alpha = 0.7
            self.startButton.alpha = 0
        }, completion: { (complete: Bool) in
            self.blurEffect.alpha = 0
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createBracketPicker()
        nextButton.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bracketTypes.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bracketTypes[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedBracketType = bracketTypes[row]
        bracketTypeTextField.text = selectedBracketType
    }
    
}
