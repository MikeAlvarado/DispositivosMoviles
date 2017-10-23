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
    var boolNewGame : Bool!
    
    //------------------------------------------------------------------------------------------------------------------
    //                                              //STATIC PROPERTIES
    
    
    //------------------------------------------------------------------------------------------------------------------
    //                                              //STATIC INITS
    static func initGame(){
       
    }
    
    
    //------------------------------------------------------------------------------------------------------------------
    //                                              //STATIC METHODS
    /*static func getCurrentGame() -> Juego{
        return nil
    }*/
    
    static func saveCurrentGame(){

    }
    
    //------------------------------------------------------------------------------------------------------------------
    //                                              //INSTANCE METHODS
    func boolUpdatePlayerName(_ strName_I: String){
        self.jugador.strNombre = strName_I
        self.boolNewGame = false
    }
    
    //------------------------------------------------------------------------------------------------------------------
    //                                            //INITS
    init(boolNewGame_I : Bool){
        self.boolNewGame = boolNewGame_I
    }
};
