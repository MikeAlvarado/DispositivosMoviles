//
//  Jugador.swift
//  LSM
//
//  Created by Jorge Mendez on 10/22/17.
//  Copyright © 2017 Jorge Mendez. All rights reserved.
//

import Foundation

class Jugador{

    var strNombre: String!
    var intXP: Int!
    var liked : NSMutableArray!
    
    init(_ strNombre_I: String,_ intXP_I: Int, liked_I : NSMutableArray){
        strNombre = strNombre_I
        intXP = intXP_I
        liked = liked_I
    }
    
    init(){
        strNombre = ""
        intXP = 0
    }
    
    func like(id : Int ) {
        if (liked.contains(id)){
            liked.remove(id)
        }
        else{
            liked.add(id)
        }
    }
    
    func isLiked( id : Int ) -> Bool{
        return liked.contains(id)
    }
    
};
