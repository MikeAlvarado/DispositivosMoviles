//
//  GameController.swift
//  LSM
//
//  Created by Jorge Mendez on 10/22/17.
//  Copyright © 2017 Jorge Mendez. All rights reserved.
//

import Foundation
import UIKit
class GameController{
    
    static var juego : Juego!
    static var data : NSMutableArray!
    static var tutoABC : [Tutorial]!
    
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
        
        loadTutorialAbecedario()
    }
    
    static func loadTutorialAbecedario(){
        tutoABC = [Tutorial]()

        tutoABC.append(Tutorial(strText_I: "A", isVideo_I: false, imgImage_I: #imageLiteral(resourceName: "i.JPG"), urlResource_I: nil))

        tutoABC.append(Tutorial(strText_I: "B", isVideo_I: false, imgImage_I: #imageLiteral(resourceName: "b.JPG"), urlResource_I: nil))
        
        tutoABC.append(Tutorial(strText_I: "C", isVideo_I: false, imgImage_I: #imageLiteral(resourceName: "c"), urlResource_I: nil))
        
        tutoABC.append(Tutorial(strText_I: "D", isVideo_I: false, imgImage_I: #imageLiteral(resourceName: "d"), urlResource_I: nil))
        
        tutoABC.append(Tutorial(strText_I: "E", isVideo_I: false, imgImage_I: #imageLiteral(resourceName: "e"), urlResource_I: nil))
        
        tutoABC.append(Tutorial(strText_I: "F", isVideo_I: false, imgImage_I: #imageLiteral(resourceName: "f"), urlResource_I: nil))
        tutoABC.append(Tutorial(strText_I: "G", isVideo_I: false, imgImage_I: #imageLiteral(resourceName: "g"), urlResource_I: nil))
        tutoABC.append(Tutorial(strText_I: "H", isVideo_I: false, imgImage_I: #imageLiteral(resourceName: "h"), urlResource_I: nil))
        tutoABC.append(Tutorial(strText_I: "I", isVideo_I: false, imgImage_I: #imageLiteral(resourceName: "i"), urlResource_I: nil))
        
         tutoABC.append(Tutorial(strText_I: "J", isVideo_I: true, imgImage_I: nil, urlResource_I: "LSM_Abecedario/j"))
        
        tutoABC.append(Tutorial(strText_I: "K", isVideo_I: true, imgImage_I: nil, urlResource_I: "LSM_Abecedario/k"))
        
        tutoABC.append(Tutorial(strText_I: "L", isVideo_I: false, imgImage_I: #imageLiteral(resourceName: "l"), urlResource_I: nil))
        
        tutoABC.append(Tutorial(strText_I: "LL", isVideo_I: true, imgImage_I: nil, urlResource_I: "LSM_Abecedario/ll"))
        
        tutoABC.append(Tutorial(strText_I: "M", isVideo_I: false, imgImage_I: #imageLiteral(resourceName: "m"), urlResource_I: nil))
        tutoABC.append(Tutorial(strText_I: "N", isVideo_I: false, imgImage_I: #imageLiteral(resourceName: "n"), urlResource_I: nil))
        
        tutoABC.append(Tutorial(strText_I: "Ñ", isVideo_I: true, imgImage_I: nil, urlResource_I: "LSM_Abecedario/nie"))
        
        tutoABC.append(Tutorial(strText_I: "O", isVideo_I: false, imgImage_I: #imageLiteral(resourceName: "o"), urlResource_I: nil))
        tutoABC.append(Tutorial(strText_I: "P", isVideo_I: false, imgImage_I: #imageLiteral(resourceName: "p"), urlResource_I: nil))
        
         tutoABC.append(Tutorial(strText_I: "Q", isVideo_I: true, imgImage_I: nil, urlResource_I: "LSM_Abecedario/q"))
        
        tutoABC.append(Tutorial(strText_I: "R", isVideo_I: false, imgImage_I: #imageLiteral(resourceName: "r"), urlResource_I: nil))
        
        tutoABC.append(Tutorial(strText_I: "RR", isVideo_I: true, imgImage_I: nil, urlResource_I: "LSM_Abecedario/rr"))
        
        tutoABC.append(Tutorial(strText_I: "S", isVideo_I: false, imgImage_I: #imageLiteral(resourceName: "s"), urlResource_I: nil))
        tutoABC.append(Tutorial(strText_I: "T", isVideo_I: false, imgImage_I: #imageLiteral(resourceName: "t"), urlResource_I: nil))
        
        tutoABC.append(Tutorial(strText_I: "U", isVideo_I: false, imgImage_I:#imageLiteral(resourceName: "u"), urlResource_I: nil))
        tutoABC.append(Tutorial(strText_I: "V", isVideo_I: false, imgImage_I: #imageLiteral(resourceName: "v"), urlResource_I: nil))
        tutoABC.append(Tutorial(strText_I: "W", isVideo_I: false, imgImage_I: #imageLiteral(resourceName: "w"), urlResource_I: nil))
        
         tutoABC.append(Tutorial(strText_I: "X", isVideo_I: true, imgImage_I: nil, urlResource_I: "LSM_Abecedario/x"))
        
        tutoABC.append(Tutorial(strText_I: "Y", isVideo_I: false, imgImage_I: #imageLiteral(resourceName: "y"), urlResource_I: nil))
        
        tutoABC.append(Tutorial(strText_I: "Z", isVideo_I: true, imgImage_I: nil, urlResource_I: "LSM_Abecedario/z"))
        
        
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
