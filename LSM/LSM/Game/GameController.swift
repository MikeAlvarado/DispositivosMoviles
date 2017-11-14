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
    static var tutos : [[Tutorial]]!
    static var ejer : [[Ejercicio]]!
    static var seccion  = [
        "Abecedario",
        "Animales",
        "Colores",
        "Comida",
        "Cuerpo",
        "Días de la semana",
        "Frutas",
        "Hogar",
        "Lugares",
        "Meses del año",
        "Numeros",
        "Personas",
        "Preguntas",
        "Preposiciones / Adjetivos / Sustantivos / Adverbios",
        "Pronombres",
        "Puestos profesiones / Oficios",
        "Ropa",
        "Saludos / Cortesias",
        "Tiempo",
        "Transporte",
        "Verbos comunes",
        "Verbos narrativos",
        "Verduras"
    ];
    
    static var idseccion  = [
        "Abecedario",
        "Animales",
        "Colores",
        "Comida",
        "Cuerpo",
        "DiasDeLaSemana",
        "Frutas",
        "Hogar",
        "Lugares",
        "MesesDelAno",
        "Numeros",
        "Personas",
        "Preguntas",
        "PreposicionesAdjetivosSustantivosAdverbios",
        "Pronombres",
        "PuestosProfesionesOficios",
        "Ropa",
        "SaludosCortesias",
        "Tiempo",
        "Transporte",
        "VerbosComunes",
        "VerbosNarrativos",
        "Verduras"
    ];
    
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
            juego.jugador = Jugador( ns["strNombre"] as! String, ns["intXP"] as! Int, liked_I: ns["liked"] as! NSMutableArray)
        }
        else{
            juego = Juego(boolNewGame_I: true)
        }
        
        loadTutorialAbecedario()
    }
    
    static func loadTutorialAbecedario(){
        var abc : NSMutableArray! = nil;
        var path = Bundle.main.path(forResource: "Tutoriales", ofType: "plist")
        var tutosTemp = NSMutableDictionary(contentsOfFile: path!)!
        
        tutos = [[Tutorial]]()
        for sec in idseccion{
        abc = tutosTemp[sec] as! NSMutableArray;
        var tutosToAdd = [Tutorial]()
            for ele in abc{
                let ns = ele as! NSMutableDictionary
                tutosToAdd.append(Tutorial(
                    strText_I: ns["text"] as! String,
                    isVideo_I: ns["isVideo"] as! Bool,
                    urlResource_I: ns["url"] as! String
                ))
            }
            tutos.append(tutosToAdd)
        }
        
        abc  = nil;
        path = Bundle.main.path(forResource: "Ejercicios", ofType: "plist")
        tutosTemp = NSMutableDictionary(contentsOfFile: path!)!
        ejer = [[Ejercicio]]()
        for sec in idseccion{
            abc = tutosTemp[sec] as! NSMutableArray;
            var tutosToAdd = [Ejercicio]()
            for ele in abc{
                let ns = ele as! NSMutableDictionary
                tutosToAdd.append(Ejercicio(
                    respuesta_I: ns["respuesta"] as! Int,
                    op1_I: ns["op1"] as! Int,
                    op2_I: ns["op2"] as! Int,
                    op3_I: ns["op3"] as! Int,
                    op4_I: ns["op4"] as! Int,
                    xp_I: ns["xp"] as! Int
                ))
            }
            ejer.append(tutosToAdd)
        }
        
        abc  = nil;
    }
    
    static func saveCurrentGame(){
        let dicc : NSMutableDictionary = ["boolNewGame" : juego.boolNewGame,
                                          "strNombre" : juego.jugador.strNombre,
                                          "intXP" : juego.jugador.intXP,
                                          "liked" : juego.jugador.liked]
        
        GameController.data = NSMutableArray()
        GameController.data.add(dicc)
        
        GameController.data.write(toFile: dataFilePath(), atomically: true)
        
        /*let dataTutos = NSMutableDictionary()
        
        for i in 0...tutos.count  - 1{
            let arr = NSMutableArray()
            for j in 0...tutos[i].count - 1 {
                let dataTutosEle = NSMutableDictionary()
                dataTutosEle["url"] = tutos[i][j].urlResource!
                dataTutosEle["text"] = tutos[i][j].strText!
                dataTutosEle["isVideo"] = tutos[i][j].isVideo!
                arr[j] = dataTutosEle
            }
            
            dataTutos[idseccion[i]] = arr
        }
        */
        
        let dataEjer = NSMutableDictionary()
        
        for i in 0...ejer.count  - 1{
            let arr = NSMutableArray()
            for j in 0...ejer[i].count - 1 {
                let dataTutosEle = NSMutableDictionary()
                dataTutosEle["respuesta"] = ejer[i][j].respuesta!
                dataTutosEle["op1"] = ejer[i][j].op1!
                dataTutosEle["op2"] = ejer[i][j].op2!
                dataTutosEle["op3"] = ejer[i][j].op3!
                dataTutosEle["op4"] = ejer[i][j].op4!
                dataTutosEle["xp"] = ejer[i][j].xp!
                arr[j] = dataTutosEle
            }
            
            dataEjer[idseccion[i]] = arr
        }
       // dataTutos.write(toFile: dataFilePathTutos(), atomically: true)
        dataEjer.write(toFile: dataFilePathEjer(), atomically: true)
    }
    
    static func boolUpdatePlayerName(_ strName_I: String){
        GameController.juego.jugador.strNombre = strName_I
        GameController.juego.boolNewGame = false
        GameController.saveCurrentGame()
    }
    static func dataFilePath() -> String
    {
        let path = Bundle.main.path(forResource: "User", ofType: "plist")
        
        return path!
    }
    
    static func dataFilePathTutos() -> String
    {
        let path = Bundle.main.path(forResource: "Tutoriales", ofType: "plist")
        
        return path!
    }
    
    static func dataFilePathEjer() -> String
    {
        let path = Bundle.main.path(forResource: "Ejercicios", ofType: "plist")
        
        return path!
    }
}
