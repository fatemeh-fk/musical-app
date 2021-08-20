//
//  ViewController.swift
//  musical app
//
//  Created by Fateme Karimi on 2021-08-20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  var player  : AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func keyPressed(_ sender: UIButton) {
       print(sender.currentTitle!)
        playSound( n1: sender.currentTitle! )
        
    }
    func playSound(n1:String) {
//        let url = Bundle.main.url(forResource: n1, withExtension: "wav")
//                player = try! AVAudioPlayer(contentsOf: //url!)
//                player.play()
        
        
        
        guard let url = Bundle.main.url(forResource: n1, withExtension: "wav") else { return }

          do {
              try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
              try AVAudioSession.sharedInstance().setActive(true)

              
              player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

              

              guard let player = player else { return }

              player.play()

          } catch let error {
              print(error.localizedDescription)
          }
    
    
}
}

