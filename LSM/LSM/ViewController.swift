//
//  ViewController.swift
//  LSM
//
//  Created by Jorge Mendez on 10/22/17.
//  Copyright © 2017 Jorge Mendez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var btGuardar: UIButton!
    
    var game: Juego!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Juego.initGame()
        game = Juego.getCurrentGame()
        
        if (!game.boolNewGame){
            tfNombre.text = game.jugador.strNombre
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func btGuardar(_ sender: UIButton) {
        game.boolUpdatePlayerName(tfNombre.text!)
        
    }
    
}

