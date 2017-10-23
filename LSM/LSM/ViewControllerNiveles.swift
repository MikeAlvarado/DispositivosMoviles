//
//  ViewControllerNiveles.swift
//  LSM
//
//  Created by Orange Investments on 10/22/17.
//  Copyright © 2017 Jorge Mendez. All rights reserved.
//

import UIKit

class ViewControllerNiveles: UIViewController {

    @IBOutlet weak var lbNivel: UILabel!
    @IBOutlet weak var lbPuntos: UILabel!
    @IBOutlet weak var btSiguiente: UIButton!
    @IBOutlet weak var btAjustes: UIButton!
    @IBOutlet weak var btTutorial: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GameController.initGame()
        
        if (GameController.juego.boolNewGame){
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "name") as! ViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
        
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btAjustes(_ sender: UIButton)
    {
        
    }
    
    @IBAction func btSiguiente(_ sender: UIButton)
    {
        
    }
    
    @IBAction func btTutorial(_ sender: UIButton) {
    }
    
    @IBAction func setFavorite(_ sender: UIButton) {
        sender.setImage(#imageLiteral(resourceName: "stra"), for: .normal)
    }
    override func unwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        loadData()
    }
    
    func loadData(){
        title = "Abecedario"
        // Do any additional setup after loading the view.
        lbNivel.text = GameController.juego.jugador.strNombre
        lbPuntos.text = "\(GameController.juego.jugador.intXP!) xp"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadData()
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
