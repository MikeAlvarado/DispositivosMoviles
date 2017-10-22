//
//  Juego.swift
//  LSM
//
//  Created by Jorge Mendez on 10/22/17.
//  Copyright © 2017 Jorge Mendez. All rights reserved.
//

import Foundation

class Juego{
    //------------------------------------------------------------------------------------------------------------------
    //                                              //INSTANCE VARIABLES
    var jugador = Jugador()
    
    //------------------------------------------------------------------------------------------------------------------
    //                                              //STATIC PROPERTIES
    
    static var arrGameData = NSMutableArray()
    
    //------------------------------------------------------------------------------------------------------------------
    //                                              //STATIC INITS
    static func initGame() -> Bool{
        let filePath = Juego.dataFilePath()
        if FileManager.default.fileExists(atPath: filePath)
        {
            Juego.arrGameData = NSMutableArray(contentsOfFile: filePath)!
            return true;
        }
        
        Juego.arrGameData =  NSMutableArray()
        Juego.arrGameData.add(Juego())
        
        return  false;
    }
    
    
    //------------------------------------------------------------------------------------------------------------------
    //                                              //STATIC METHODS
    static func getCurrentGame() -> Juego{
        return (Juego.arrGameData.object(at: 0) as! Juego)
    }
    
    static func saveCurrentGame(){
        Juego.arrGameData.write(toFile: Juego.dataFilePath(), atomically: true)
    }
    
    static func dataFilePath() -> String
    {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]

        return documentsDirectory.appending("/data.plist")
    }
    
    //------------------------------------------------------------------------------------------------------------------
    //                                              //INSTANCE METHODS
    func boolUpdatePlayerName(_ strName_I: String){
        self.jugador.strNombre = strName_I;
        
    }
    
    //------------------------------------------------------------------------------------------------------------------
    //                                            //INITS
    init(){

    }
};
