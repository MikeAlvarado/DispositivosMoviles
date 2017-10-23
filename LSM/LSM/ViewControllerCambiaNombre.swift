//
//  ViewControllerCambiaNombre.swift
//  LSM
//
//  Created by Jorge Mendez, Fernando Pompa, and Miguel Alvarado on 10/22/17.
//  Copyright © 2017 ITESM. All rights reserved.
//

import UIKit

class ViewControllerCambiaNombre: UIViewController {

    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var btContinuar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       /* let colorTop =  UIColor(red: 255.0/255.0, green: 163.0/255.0, blue: 26.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ colorTop, colorBottom]
        gradientLayer.locations = [ 0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)*/
        // Do any additional setup after loading the view.
        
        tfNombre.text = GameController.juego.jugador.strNombre
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btContinuar(_ sender: UIButton)
    {
        GameController.boolUpdatePlayerName(tfNombre.text!)
            navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
