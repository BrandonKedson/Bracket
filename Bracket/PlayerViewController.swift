//
//  PlayerViewController.swift
//  Bracket
//
//  Created by Owner on 2/24/18.
//  Copyright © 2018 Owner. All rights reserved.
//

import UIKit

var playersList = [String]()

class PlayerViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var verticalSlider: UISlider!{
        didSet{
            verticalSlider.maximumValue = Float(settings.numPlayers!)
            verticalSlider.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        }
    }
    
    @IBOutlet weak var playerText: UITextField!
    
    @IBAction func backButtonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "backSegue", sender: self)
    }
    
    @IBOutlet weak var firstPlayersDisplay: UILabel!
    @IBOutlet weak var secondPlayersDisplay: UILabel!
    @IBOutlet weak var thirdPlayersDisplay: UILabel!
    @IBOutlet weak var fourthPlayersDisplay: UILabel!
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath){
        
    }
    @IBAction func donePressed(_ sender: UITextField) {
        var alreadyPlayer = false
        for player in playersList{
            if player == playerText.text{
                alreadyPlayer = true
            }
        }
        if playerText.text != "" && playersList.count<settings.numPlayers! && !alreadyPlayer && playerText.text?.first != " "{
            playersList.append(playerText.text!)
            playerText.text = ""
            firstPlayersDisplay.text?.removeAll()
            secondPlayersDisplay.text?.removeAll()
            thirdPlayersDisplay.text?.removeAll()
            fourthPlayersDisplay.text?.removeAll()

            if playersList.count>Int(verticalSlider.value){
                firstPlayersDisplay.text! = playersList[Int(verticalSlider.value)]
            }
            if playersList.count>Int(verticalSlider.value)+1{
                secondPlayersDisplay.text! = playersList[Int(verticalSlider.value)+1]
            }
            if playersList.count>Int(verticalSlider.value)+2{
                thirdPlayersDisplay.text! = playersList[Int(verticalSlider.value)+2]
            }
            if playersList.count>Int(verticalSlider.value)+3{
                fourthPlayersDisplay.text! = playersList[Int(verticalSlider.value)+3]
            }
        }
    }
    @IBAction func playerScroll(_ sender: UISlider) {
        if playersList.count>Int(verticalSlider.value){
            firstPlayersDisplay.text! = playersList[Int(verticalSlider.value)]
        }
        else{
            firstPlayersDisplay.text! = ""
        }
        if playersList.count>Int(verticalSlider.value)+1{
            secondPlayersDisplay.text! = playersList[Int(verticalSlider.value)+1]
        }
        else{
            secondPlayersDisplay.text! = ""
        }
        if playersList.count>Int(verticalSlider.value)+2{
            thirdPlayersDisplay.text! = playersList[Int(verticalSlider.value)+2]
        }
        else{
            thirdPlayersDisplay.text! = ""
        }
        if playersList.count>Int(verticalSlider.value)+3{
            fourthPlayersDisplay.text! = playersList[Int(verticalSlider.value)+3]
        }
        else{
            fourthPlayersDisplay.text! = ""
        }
    }
    @IBAction func clickedOffPlayerField(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    @IBAction func addPlayer(_ sender: UIButton) {
        textView.text = ""
        var alreadyPlayer = false
        for player in playersList{
            if player == playerText.text{
                alreadyPlayer = true
            }
        }
        if playerText.text != "" && playersList.count<settings.numPlayers! && !alreadyPlayer && playerText.text?.first != " "{
            for name in playersList{
//                textView.text += "\(name)"
            }
            playersList.append(playerText.text!)
            playerText.text = ""
            firstPlayersDisplay.text?.removeAll()
            secondPlayersDisplay.text?.removeAll()
            thirdPlayersDisplay.text?.removeAll()
            fourthPlayersDisplay.text?.removeAll()
            if playersList.count>Int(verticalSlider.value){
                firstPlayersDisplay.text! = playersList[Int(verticalSlider.value)]
            }
            if playersList.count>Int(verticalSlider.value)+1{
                secondPlayersDisplay.text! = playersList[Int(verticalSlider.value)+1]
            }
            if playersList.count>Int(verticalSlider.value)+2{
                thirdPlayersDisplay.text! = playersList[Int(verticalSlider.value)+2]
            }
            if playersList.count>Int(verticalSlider.value)+3{
                fourthPlayersDisplay.text! = playersList[Int(verticalSlider.value)+3]
            }
        }
    }
    
    @IBAction func startButtonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "secondSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        verticalSlider.setValue(0, animated: false)
        playerText.attributedPlaceholder = NSAttributedString.init(string: "ENTER A NAME", attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
        if playersList.count>Int(verticalSlider.value){
            firstPlayersDisplay.text! = playersList[Int(verticalSlider.value)]
        }
        else{
            firstPlayersDisplay.text! = ""
        }
        if playersList.count>Int(verticalSlider.value)+1{
            secondPlayersDisplay.text! = playersList[Int(verticalSlider.value)+1]
        }
        else{
            secondPlayersDisplay.text! = ""
        }
        if playersList.count>Int(verticalSlider.value)+2{
            thirdPlayersDisplay.text! = playersList[Int(verticalSlider.value)+2]
        }
        else{
            thirdPlayersDisplay.text! = ""
        }
        if playersList.count>Int(verticalSlider.value)+3{
            fourthPlayersDisplay.text! = playersList[Int(verticalSlider.value)+3]
        }
        else{
            fourthPlayersDisplay.text! = ""
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
