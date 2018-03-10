//
//  MatchSettings.swift
//  Bracket
//
//  Created by Brandon Kedson (student LM) on 3/6/18.
//  Copyright © 2018 Owner. All rights reserved.
//

import Foundation

class MatchSettings{
    
    var teams: Bool? = false
    var seeding: Bool? = false
    var elo: Bool? = false
    var bi: Bool? = false
    var numPlayers: Int? = 4
    var bracketType: Int? = 1
    var timePerMatch: Double? = 5.0
    
    init(teams: Bool = false, seeding: Bool = false, elo: Bool = false, numPlayers: Int = 4, bracketType: Int = 1, timePerMatch: Double = 5.0, bi: Bool = false){
        self.teams = teams
        self.seeding = seeding
        self.elo = elo
        self.bi = bi
        self.numPlayers = numPlayers
        self.bracketType = bracketType
        self.timePerMatch = timePerMatch
    }
    
    func resetSettings(){
        teams = false
        seeding = false
        elo = false
        bi = false
        numPlayers = 4
        bracketType = 1
        timePerMatch = 5.0
    }
    
}
