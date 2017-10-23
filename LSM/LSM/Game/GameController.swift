//
//  GameController.swift
//  LSM
//
//  Created by Jorge Mendez on 10/22/17.
//  Copyright © 2017 Jorge Mendez. All rights reserved.
//

import Foundation
class GameController{
    
    static var juego : Juego!
    static var data : NSMutableArray!
    
    //------------------------------------------------------------------------------------------------------------------
    //                                              //STATIC INITS
    static func initGame(){
        
        let filePath = GameController.dataFilePath()
        if FileManager.default.fileExists(atPath: filePath)
        {
            GameController.data = NSMutableArray(contentsOfFile: filePath)!
        }
        
        GameController.loadCurrentGame()
    
    }
    
    //------------------------------------------------------------------------------------------------------------------
    //                                              //STATIC METHODS

    static func loadCurrentGame(){
        if (GameController.data != nil) {
            let ns = (data.object(at: 0) as! NSMutableDictionary )
            juego = Juego(boolNewGame_I: ns["boolNewGame"] as! Bool)
            juego.jugador = Jugador( ns["strNombre"] as! String, ns["intXP"] as! Int)
        }
        else{
            juego = Juego(boolNewGame_I: true)
        }
    }
    
    static func saveCurrentGame(){
        let dicc : NSMutableDictionary = ["boolNewGame" : juego.boolNewGame,
                                          "strNombre" : juego.jugador.strNombre,
                                          "intXP" : juego.jugador.intXP]
        
        GameController.data = NSMutableArray()
        GameController.data.add(dicc)
        
        GameController.data.write(toFile: dataFilePath(), atomically: true)
    }
    
    static func boolUpdatePlayerName(_ strName_I: String){
        GameController.juego.jugador.strNombre = strName_I
        GameController.juego.boolNewGame = false
        GameController.saveCurrentGame()
    }
    static func dataFilePath() -> String
    {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        
        return documentsDirectory.appending("/data.plist")
    }
}
