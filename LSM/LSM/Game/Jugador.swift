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
    
    init(_ strNombre_I: String,_ intXP_I: Int){
        strNombre = strNombre_I
        intXP = intXP_I
    }
    
    init(){
        strNombre = ""
        intXP = 0
    }
    
    
};
