//
//  ViewControllerTutorialess.swift
//  LSM
//
//  Created by Orange Investments on 10/22/17.
//  Copyright © 2017 Jorge Mendez. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewControllerTutorialess: UIViewController {

    @IBOutlet weak var lbTittulo: UILabel!
    @IBOutlet weak var lbRespuesta: UILabel!
    @IBOutlet weak var lbSubtitulo: UILabel!
    @IBOutlet weak var uiImagen: UIImageView!
    @IBOutlet weak var btSiguiente: UIButton!
    @IBOutlet weak var btnPlay: UIButton!
    
   var intT = 0
    var strCurrentLetra = "a"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Tutorial"
        // Do any additional setup after loading the view.
        
        uiImagen.image = GameController.tutoABC[intT].imgImage
        lbRespuesta.text = GameController.tutoABC[intT].strText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btSiguiente(_ sender: UIButton) {
        
        
        if ( GameController.tutoABC.count > intT + 1)
        {
             btnPlay.isHidden = true
            intT = intT + 1
            uiImagen.image = GameController.tutoABC[intT].imgImage
            lbRespuesta.text = GameController.tutoABC[intT].strText
            
            if (GameController.tutoABC[intT].isVideo){
                 btnPlay.isHidden = false
                strCurrentLetra = GameController.tutoABC[intT].urlResource
                playVideo(strLetra: GameController.tutoABC[intT].urlResource)
            }
        }
    }
    
    @IBAction func btAnt(_ sender: UIButton) {
        
        if ( -1 < intT - 1)
        {
             btnPlay.isHidden = true
            intT = intT - 1
            uiImagen.image = GameController.tutoABC[intT].imgImage
            lbRespuesta.text = GameController.tutoABC[intT].strText
            
            if (GameController.tutoABC[intT].isVideo){
                btnPlay.isHidden = false
                strCurrentLetra = GameController.tutoABC[intT].urlResource
                playVideo(strLetra: GameController.tutoABC[intT].urlResource)
            }
        }
    }
    
    
    @IBAction func play(_ sender: Any) {
        playVideo(strLetra: strCurrentLetra)
    }
    
    private func playVideo( strLetra : String) {
        guard let path = Bundle.main.path(forResource: strLetra, ofType:"mp4") else {
            debugPrint("video.m4v not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
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
