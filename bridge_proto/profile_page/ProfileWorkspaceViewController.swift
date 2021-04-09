//
//  ProfileWorkspaceViewController.swift
//  bridge_proto
//
//  Created by Adhitya Laksamana Bayu Adrian on 09/04/21.
//

import UIKit
import AVFoundation

class ProfileWorkspaceViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    
    
    @IBOutlet weak var songSlider: UISlider!
    @IBOutlet weak var soundLength: UILabel!
    @IBOutlet weak var soundName: UILabel!

    func updateTime(){
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let sound = Bundle.main.path(forResource: "tothebone", ofType: "mp3")
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        catch{
            print(error)
        }
        songSlider.maximumValue = Float(audioPlayer.duration)
//        songSlider.setValue(50, animated: true)
    }
    @IBAction func playSound(_ sender: Any) {
        audioPlayer.play()
        Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(fire), userInfo: nil, repeats: true)
    }
    @IBAction func stopSound(_ sender: Any) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
    }
    @IBAction func pauseSound(_ sender: Any) {
        audioPlayer.pause()
    }
    
    @IBAction func songSlider(_ sender: Any) {
        var minutes = songSlider.value/60
        var seconds = minutes / 60
        soundLength.text = NSString(format: "0%d:%f", Int(minutes), seconds) as String
        audioPlayer.stop()
        audioPlayer.currentTime = TimeInterval(songSlider.value)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
    }
    @objc func fire(){
        songSlider.setValue(Float(audioPlayer.currentTime), animated: true)
    }
        func updateSlider(){
        
        songSlider.value = Float(audioPlayer.currentTime)
        
    }
}
