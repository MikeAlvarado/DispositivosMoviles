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
        let colorTop =  UIColor(red: 255.0/255.0, green: 163.0/255.0, blue: 26.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ colorTop, colorBottom]
        gradientLayer.locations = [ 0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
       
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

