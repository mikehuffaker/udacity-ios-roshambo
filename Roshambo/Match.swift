//
//  PlayType.swift
//  Roshambo
//
//  Created by Mike Huffaker on 11/4/16.
//  Copyright © 2016 Mike Huffaker. All rights reserved.
//

import Foundation

enum PlayType : Int
{
    case Nothing = 0, Rock = 1, Paper = 2, Scissors = 3
}

// This is a central class to encapsulate most of the logic in playing a round of 
// Roshambo and calculating the winner.  I pulled it out of the view controller
// since Roshambo is being updated with another view controller to display the
// history.
//
// It could probably be cleaned up a bit more.  I went back and forth on whether I
// should define the PlayType enum in the class or external to the class, as it is now.
class Match
{
    var computerPlay : PlayType
    var humanPlay : PlayType
    
    // winner = 0: Tie, winner = 1: Computer, winner = 2: Human player
    var winner : Int
    var winMessage : String
    var detailMessage : String
    var imageName : String
    
    // 2 constructors, one with both player's choices, one without.  Also using undefined
    // as initial value for message and image name so it will show up in the app to aid
    // debugging if the calling code forgets to call calculateWinner().
    init ( humanPlay : PlayType )
    {
        self.computerPlay = PlayType( rawValue: 0 )!
        self.humanPlay = humanPlay
        self.winner = 0
        self.winMessage = "undefined"
        self.detailMessage = "undefined"
        self.imageName = "undefined"
    }
    
    init ( computerPlay : PlayType, humanPlay: PlayType )
    {
        self.computerPlay = computerPlay
        self.humanPlay = humanPlay
        self.winner = 0
        self.winMessage = "undefined"
        self.detailMessage = "undefined"
        self.imageName = "undefined"
    }
    
    // Calculate the winner - and set values in class accordingly
    func calculateWinner () -> Int
    {
        // If computer play value wasn't passed in, the set it randomly to simulate the computer player
        if computerPlay ==  PlayType.Nothing
        {
            computerPlay = PlayType( rawValue: randomPlayValue() )!
        }
        
        switch ( humanPlay, computerPlay )
        {
            case ( .Rock, .Rock ):
                winner = 0
                detailMessage = "You picked Rock and Computer picked Rock!"
                imageName = "itsATie"
            
            case ( .Rock, .Paper ):
                winner = 1
                detailMessage = "You picked Rock and Computer picked Paper!"
                imageName = "PaperCoversRock"
            
            case ( .Rock, .Scissors ):
                winner = 2
                detailMessage = "You picked Rock and Computer picked Scissors!"
                imageName = "RockCrushesScissors"
            
            case ( .Paper, .Paper ):
                winner = 0
                detailMessage = "You picked Paper and Computer picked Paper!"
                imageName = "itsATie"
            
            case ( .Paper, .Rock ):
                winner = 2
                detailMessage = "You picked Paper and Computer picked Rock!"
                imageName = "PaperCoversRock"
            
            case ( .Paper, .Scissors ):
                winner = 1
                detailMessage = "You picked Paper and Computer picked Scissors!"
                imageName = "ScissorsCutPaper"
            
            case ( .Scissors, .Scissors ):
                winner = 0
                detailMessage = "You picked Scissors and Computer picked Scissors!"
                imageName = "itsATie"
            
            case ( .Scissors, .Rock ):
                winner = 1
                detailMessage = "You picked Scissors and Computer picked Rock!"
                imageName = "RockCrushesScissors"
            
            case ( .Scissors, .Paper ):
                winner = 2
                detailMessage = "You picked Scissors and Computer picked Paper!"
                imageName = "ScissorsCutPaper"
            
            default:
                winner = 0
        }

        // Set win/lose/tie message
        if ( winner == 0 )
        {
            winMessage = "Its A Tie!"
        }
        else if ( winner == 1 )
        {
            winMessage = "You Lost!"
        }
        else if ( winner == 2 )
        {
            winMessage = "You Won!"
        }
        
        return winner
    }
    
    // If no value is passed in for the computers play, then randomly select one.
    func randomPlayValue() -> Int
    {
        print( "in Match::randomPlayValue()")
        
        let randomValue = 1 + arc4random() % 3
        
        print( "Returning:", randomValue)
        return Int(randomValue)
    }
}
