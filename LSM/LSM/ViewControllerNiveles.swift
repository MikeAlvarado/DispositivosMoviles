//
//  ViewControllerNiveles.swift
//  LSM
//
//  Created by Jorge Mendez, Fernando Pompa, and Miguel Alvarado on 10/22/17.
//  Copyright © 2017 ITESM. All rights reserved.
//

import UIKit

class ViewControllerNiveles: UIViewController {

    @IBOutlet weak var lbNivel: UILabel!
    @IBOutlet weak var lbPuntos: UILabel!
    @IBOutlet weak var btSiguiente: UIButton!
    @IBOutlet weak var btAjustes: UIButton!
    @IBOutlet weak var btTutorial: UIButton!
    @IBOutlet weak var btnLevel: UIButton!
    
    @IBOutlet weak var btnAnt: UIButton!
    @IBOutlet weak var btnLock: UIButton!
    @IBOutlet weak var star: UIButton!
    
    var intSeccion = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GameController.initGame()
        
        if (GameController.juego.boolNewGame){
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController =
                self.storyboard?.instantiateViewController(withIdentifier: "name") as! ViewController
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
    
    @IBAction func btAnt(_ sender: UIButton)
    {
        if (intSeccion > 0){
            intSeccion -= 1
            btSiguiente.isEnabled = true;
            sender.isEnabled = true
        }
        else{
            sender.isEnabled = false
        }
        
        loadData()
    }
    
    @IBAction func btSiguiente(_ sender: UIButton)
    {
        if (intSeccion < GameController.seccion.count - 1){
            intSeccion += 1
            btnAnt.isEnabled = true;
            sender.isEnabled = true
        }
        else{
            sender.isEnabled = false
        }
        
        loadData()
    }
    
    @IBAction func btTutorial(_ sender: UIButton) {
    }
    
    func refreshUI(){
        
    }
    
    @IBAction func setFavorite(_ sender: UIButton) {
        GameController.juego.jugador.like(id: intSeccion)
        GameController.saveCurrentGame()
        loadData()
    }
    override func unwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        loadData()
    }
    
    func loadData(){
        title = GameController.seccion[intSeccion]
        btnLevel.setTitle(String(intSeccion + 1), for: .normal)
        // Do any additional setup after loading the view.
        lbNivel.text = GameController.juego.jugador.strNombre
        lbPuntos.text = "\(GameController.juego.jugador.intXP!) xp"
        
        if (GameController.juego.jugador.isLiked(id: intSeccion)){
                star.setImage(#imageLiteral(resourceName: "stra"), for: .normal)
        }
        else{
             star.setImage(#imageLiteral(resourceName: "star"), for: .normal)
        }
        
        let reqXp = (intSeccion * 6 * 5)
        if  GameController.juego.jugador.intXP >= reqXp {
            btnLock.isHidden = true
            btnLevel.isEnabled = true
        }
        else{
            btnLock.isHidden = false
            btnLevel.isEnabled = false
            btnLock.setTitle("\(reqXp) xp", for: .normal)
            btnLock.titleLabel?.adjustsFontSizeToFitWidth = true
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadData()
    }
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let dest = segue.destination as? ViewControllerTutorialess {
            dest.indexToTuto = intSeccion
        }
        else if let dest = segue.destination as? ViewControllerGames {
            dest.indexToEjer = intSeccion
        }
    }
    

}
