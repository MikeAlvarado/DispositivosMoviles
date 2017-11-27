//
//  ViewControllerGames.swift
//  LSM
//
//  Created by Jorge Mendez on 11/14/17.
//  Copyright © 2017 Jorge Mendez. All rights reserved.
//

import UIKit
import AVKit

class ViewControllerGames: UIViewController {

    @IBOutlet weak var lbTittulo: UILabel!

    @IBOutlet weak var uiImagen: UIImageView!
    @IBOutlet weak var btSiguiente: UIButton!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var lbWin: UILabel!
    @IBOutlet weak var btnAnt: UIButton!
    
    @IBOutlet weak var op1: UIButton!
    @IBOutlet weak var op2: UIButton!
    @IBOutlet weak var op3: UIButton!
    @IBOutlet weak var op4: UIButton!
    
    var indexToEjer = 0;
    var intT = 0
    var strCurrentLetra = "a"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadUI();
        title = GameController.seccion[indexToEjer]
        
        // Do any additional setup after loading the view.
        
        
    }
    
    func loadUI(){
        let indexToTuto = GameController.ejer[indexToEjer][intT].respuesta!
        lbTittulo.text = "Ejercicio \(intT + 1)"
        if (GameController.tutos[indexToEjer][indexToTuto].isVideo){
            btnPlay.isHidden = false
            strCurrentLetra = GameController.tutos[indexToEjer][indexToTuto].getComplteURL()
            playVideo(strURL: GameController.tutos[indexToEjer][indexToTuto].getComplteURL())
        }else{
            uiImagen.image = GameController.tutos[indexToEjer][indexToTuto].getImage()
        }
        
        if GameController.ejer[indexToEjer][intT].xp == 0{
            lbWin.text = "RESUELTO"
            lbWin.textColor = .green
        }
        else{
            lbWin.text = "Selecciona el correcto"
            lbWin.textColor = .black
        }
        
        var indexToOp1 = GameController.ejer[indexToEjer][intT].op1!
        op1.setBackgroundImage(#imageLiteral(resourceName: "btnGray"), for: .normal)
        op1.setTitle(GameController.tutos[indexToEjer][indexToOp1].strText, for: .normal)
        
        indexToOp1 = GameController.ejer[indexToEjer][intT].op2!
        op2.setBackgroundImage(#imageLiteral(resourceName: "btnGray"), for: .normal)
        op2.setTitle(GameController.tutos[indexToEjer][indexToOp1].strText, for: .normal)
        
        indexToOp1 = GameController.ejer[indexToEjer][intT].op3!
        op3.setBackgroundImage(#imageLiteral(resourceName: "btnGray"), for: .normal)
        op3.setTitle(GameController.tutos[indexToEjer][indexToOp1].strText, for: .normal)
        
        indexToOp1 = GameController.ejer[indexToEjer][intT].op4!
        op4.setBackgroundImage(#imageLiteral(resourceName: "btnGray"), for: .normal)
        op4.setTitle(GameController.tutos[indexToEjer][indexToOp1].strText, for: .normal)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btSiguiente(_ sender: UIButton) {
        
        
        if ( GameController.ejer[indexToEjer].count > intT + 1)
        {
            btnPlay.isHidden = true
            intT = intT + 1
            loadUI();
            btnAnt.isEnabled = true;
        }
        else{
             sender.isEnabled = false;
        }
    }
    
    @IBAction func btAnt(_ sender: UIButton) {
        
        if ( -1 < intT - 1)
        {
            btnPlay.isHidden = true
            intT = intT - 1
            btSiguiente.isEnabled = true;
            loadUI();
        }else{
            sender.isEnabled = false;
        }
    }
    
    @IBAction func selectOp(_ sender: UIButton) {
         let indexToTuto = GameController.ejer[indexToEjer][intT].respuesta!
        
        if ( GameController.tutos[indexToEjer][indexToTuto].strText  == sender.titleLabel?.text )
        {
            sender.setBackgroundImage(#imageLiteral(resourceName: "btnOrange"), for: .normal)
            GameController.juego.jugador.intXP! += GameController.ejer[indexToEjer][intT].xp!
            GameController.ejer[indexToEjer][intT].xp = 0;
            
            GameController.saveCurrentGame()
            lbWin.text = "RESUELTO"
            lbWin.textColor = .green
        }
    }
    
    
    @IBAction func play(_ sender: Any) {
        playVideo(strURL: strCurrentLetra)
    }
    
    private func playVideo( strURL : String) {
        
        let player = AVPlayer(url: URL(string: strURL)! )
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
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
