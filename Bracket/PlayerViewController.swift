//
//  PlayerViewController.swift
//  Bracket
//
//  Created by Owner on 2/24/18.
//  Copyright © 2018 Owner. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {

    var players = [String]()
    @IBOutlet weak var verticalSlider: UISlider!{
        didSet{
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
    
    @IBAction func playerScroll(_ sender: UISlider) {
        if players.count>Int(verticalSlider.value){
            firstPlayersDisplay.text! = players[Int(verticalSlider.value)]
        }
        else{
            firstPlayersDisplay.text! = ""
        }
        if players.count>Int(verticalSlider.value)+1{
            secondPlayersDisplay.text! = players[Int(verticalSlider.value)+1]
        }
        else{
            secondPlayersDisplay.text! = ""
        }
        if players.count>Int(verticalSlider.value)+2{
            thirdPlayersDisplay.text! = players[Int(verticalSlider.value)+2]
        }
        else{
           thirdPlayersDisplay.text! = ""
        }
        if players.count>Int(verticalSlider.value)+3{
            fourthPlayersDisplay.text! = players[Int(verticalSlider.value)+3]
        }
        else{
            fourthPlayersDisplay.text! = ""
        }
    }
    @IBAction func addPlayer(_ sender: UIButton) {
        players.append(playerText.text!)
        print(players)
        playerText.text = ""
        firstPlayersDisplay.text?.removeAll()
        secondPlayersDisplay.text?.removeAll()
        thirdPlayersDisplay.text?.removeAll()
        fourthPlayersDisplay.text?.removeAll()
        
        if players.count>Int(verticalSlider.value){
        firstPlayersDisplay.text! = players[Int(verticalSlider.value)]
        }
        if players.count>Int(verticalSlider.value)+1{
        secondPlayersDisplay.text! = players[Int(verticalSlider.value)+1]
        }
        if players.count>Int(verticalSlider.value)+2{
        thirdPlayersDisplay.text! = players[Int(verticalSlider.value)+2]
        }
        if players.count>Int(verticalSlider.value)+3{
        fourthPlayersDisplay.text! = players[Int(verticalSlider.value)+3]
        }

    }
    
    @IBAction func startButtonClicked(_ sender: UIButton) {
         performSegue(withIdentifier: "secondSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        playerText.placeholder = "ENTER A NAME"
        verticalSlider.setValue(0, animated: false)
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
