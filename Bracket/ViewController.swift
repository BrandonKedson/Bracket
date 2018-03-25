//
//  ViewController.swift
//  Bracket
//
//  Created by Owner on 2/24/18.
//  Copyright © 2018 Owner. All rights reserved.
//

import UIKit

//Global variables
var settings = MatchSettings(teams: true, seeding: true, elo: false, numPlayers: 4, bracketType: 1, timePerMatch: 5.0, bi: false) /* Settings variable used to store information about the game preferences */
var beginButtonClicked : Bool = false /* Determines if the view has been opened before (for viewdidload) */

class ViewController: UIViewController{

//Instance variables
    let bracketTypes = ["SINGLE ELIMINATION", "ROUND ROBIN", "DOUBLE ELIMINATION"] /* Array of types of brackets */
    var selectedBracketType: String? /* Which bracket the user has selected */
    @IBOutlet weak var playerValueDisplay: UILabel! /* The label showing number of players chosen above the slider */
    @IBOutlet weak var playerSliderValue: UISlider! /* Value the slider is currently on (how many players there are) */
    @IBOutlet weak var teamsOnDisplay: UILabel! /* Label that says 'teams' and changes alpha from the team button */
    @IBOutlet weak var seedingOnDisplay: UILabel!/* Label that says 'seeding' and changes alpha from the seeding button */
    @IBOutlet weak var teamButton: UISwitch! /* Button that changes whether teams are on or off */
    @IBOutlet weak var seedingButton: UISwitch! /* Button that changes whether seeding is on or off */
    @IBOutlet weak var nextButton: UIButton! /* Button that goes to the next view */
    @IBOutlet weak var blurEffect: UIVisualEffectView! /* Blur effect that disappears when you click begin */
    @IBOutlet weak var bracketTypeTextField: UITextField! /* The thing you use to select which bracket you want */
    @IBOutlet weak var startButton: UIButton! /* Button you click to begin choosing settings */
    
    //Next button clicked to go to the next view, determines settings values based on what player has chosen
    @IBAction func nextClicked(_ sender: UIButton) {
        settings.teams = teamButton.isOn
        settings.elo = false /* NOT YET ADDED */
        settings.bi = false /* NOT YET ADDED */
        if (selectedBracketType?.contains("SINGLE"))!{
            settings.bracketType = 1
        }
        else if (selectedBracketType?.description.contains("DOUBLE"))!{
            settings.bracketType = 3
        }
        else{
            settings.bracketType = 2
        }
        settings.numPlayers = Int(playerSliderValue.value)
        settings.timePerMatch = 5.0 /* NOT YET ADDED */
        performSegue(withIdentifier: "firstSegue", sender: self)
    }
    
    //When you click on the slider and the value either changes or stays the same. Will determine if game is playable based
    //on how many players the user chose. Will also set the label that shows how many players the user chose
    @IBAction func playerSlidingDone(_ sender: UISlider) {
        //Determines whether or not to say players/player for grammatical purposes
        if Int(playerSliderValue.value) > 1{
            playerValueDisplay.text = "\(Int(playerSliderValue.value)) PLAYERS"
        }
        else{
            playerValueDisplay.text = "\(Int(playerSliderValue.value)) PLAYER"
        }
        //Determines if the user has chosen a bracket type yet. Enables or disables next button respectively
        if playerSliderValue.value < 4 || (bracketTypeTextField.text?.contains("SELECT"))!{
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
    //User turned on teams or turned it off
    @IBAction func teamButtonClicked(_ sender: UISwitch) {
        settings.teams = teamButton.isOn
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
    //User enabled or disabled seeding
    @IBAction func seedingButtonClicked(_ sender: UISwitch) {
        settings.seeding = seedingButton.isOn
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
    //User hit somewhere on the screen after choosing their bracket type
    @IBAction func clickedOffBracketType(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    //Creates the pickerview scrolly thing
    func createBracketPicker() {
        let bracketPicker = UIPickerView()
        bracketPicker.delegate = self
        bracketTypeTextField.inputView = bracketPicker
        bracketPicker.backgroundColor = UIColor(displayP3Red: 255, green: 126, blue: 121, alpha: 1)
    }
    //
    @IBAction func startButtonClicked(_ sender: UIButton) {
        if !beginButtonClicked{
            beginButtonClicked = true
            UIView.animate(withDuration: 1, animations: {
                self.blurEffect.alpha = 0
                self.startButton.alpha = 0
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createBracketPicker()
        nextButton.isEnabled = false
        if beginButtonClicked{
            nextButton.isEnabled = true
            nextButton.alpha = 1
            playerSliderValue.value = Float(settings.numPlayers!)
            playerValueDisplay.text = "\(Int(playerSliderValue.value)) PLAYERS"
            if settings.bracketType == 1{
                bracketTypeTextField.text = "SINGLE ELIMINATION"
                selectedBracketType = "SINGLE ELIMINATION"
            }
            if settings.bracketType == 2{
                bracketTypeTextField.text = "ROUND ROBIN"
               selectedBracketType = "ROUND ROBIN"
            }
            if settings.bracketType == 3{
                bracketTypeTextField.text = "DOUBLE ELIMINATION"
                selectedBracketType = "DOUBLE ELIMINATION"
            }
            seedingButton.isOn = settings.seeding!
            if !seedingButton.isOn{
                seedingOnDisplay.alpha = 0.4
            }
            teamButton.isOn = settings.teams!
            if !teamButton.isOn{
                teamsOnDisplay.alpha = 0.4
            }
            blurEffect.alpha = 0
            startButton.alpha = 0
        }
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
        if playerSliderValue.value < 4 || (bracketTypeTextField.text?.contains("TYPE"))!{
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
    
}
