//
//  ViewControllerTutorialess.swift
//  LSM
//
//  Created by Jorge Mendez, Fernando Pompa, and Miguel Alvarado on 10/22/17.
//  Copyright © 2017 ITESM. All rights reserved.
//

import UIKit

class ViewControllerTutorialess: UIViewController {

    @IBOutlet weak var lbTittulo: UILabel!
    @IBOutlet weak var lbRespuesta: UILabel!
    @IBOutlet weak var lbSubtitulo: UILabel!
    @IBOutlet weak var uiImagen: UIImageView!
    @IBOutlet weak var btSiguiente: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Tutorial"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btSiguiente(_ sender: UIButton) {
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
