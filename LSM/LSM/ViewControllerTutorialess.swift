//
//  ViewControllerTutorialess.swift
//  LSM
//
//  Created by Jorge Mendez, Fernando Pompa, and Miguel Alvarado on 10/22/17.
//  Copyright © 2017 ITESM. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewControllerTutorialess: UIViewController {

    @IBOutlet weak var lbTittulo: UILabel!
    @IBOutlet weak var lbRespuesta: UILabel!
    @IBOutlet weak var uiImagen: UIImageView!
    @IBOutlet weak var btSiguiente: UIButton!
    @IBOutlet weak var btnPlay: UIButton!
    
    var indexToTuto = 1;
    var intT = 0
    var strCurrentLetra = "a"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = GameController.seccion[indexToTuto]
        lbTittulo.text = GameController.seccion[indexToTuto]
        // Do any additional setup after loading the view.
        
        lbRespuesta.text = GameController.tutos[indexToTuto][intT].strText
        
        if (GameController.tutos[indexToTuto][intT].isVideo){
            btnPlay.isHidden = false
            strCurrentLetra = GameController.tutos[indexToTuto][intT].getComplteURL()
            playVideo(strURL: GameController.tutos[indexToTuto][intT].getComplteURL())
        }else{
            uiImagen.image = GameController.tutos[indexToTuto][intT].getImage()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btSiguiente(_ sender: UIButton) {
        
        
        if ( GameController.tutos[indexToTuto].count > intT + 1)
        {
            btnPlay.isHidden = true
            intT = intT + 1
            lbRespuesta.text = GameController.tutos[indexToTuto][intT].strText
            
            if (GameController.tutos[indexToTuto][intT].isVideo){
                btnPlay.isHidden = false
                strCurrentLetra = GameController.tutos[indexToTuto][intT].getComplteURL()
                playVideo(strURL: GameController.tutos[indexToTuto][intT].getComplteURL())
            }else{
            uiImagen.image = GameController.tutos[indexToTuto][intT].getImage()
            }
           
            
        
        }
    }
    
    @IBAction func btAnt(_ sender: UIButton) {
        
        if ( -1 < intT - 1)
        {
             btnPlay.isHidden = true
            intT = intT - 1
            lbRespuesta.text = GameController.tutos[indexToTuto][intT].strText
            
            if (GameController.tutos[indexToTuto][intT].isVideo){
                btnPlay.isHidden = false
                strCurrentLetra = GameController.tutos[indexToTuto][intT].getComplteURL()
                playVideo(strURL: GameController.tutos[indexToTuto][intT].getComplteURL())
            }else{
                uiImagen.image = GameController.tutos[indexToTuto][intT].getImage()
            }
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
