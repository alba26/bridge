//
//  ProfileWorkspaceViewController.swift
//  bridge_proto
//
//  Created by Adhitya Laksamana Bayu Adrian on 09/04/21.
//

import UIKit
//import AVFoundation

class ProfileWorkspaceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    @IBOutlet weak var songWidgetCollection: UITableView!
//
    @IBOutlet weak var createWorkspace: UIButton!
    //    @IBOutlet weak var songSlider: UISlider!
//    @IBOutlet weak var soundLength: UILabel!
//    @IBOutlet weak var soundName: UILabel!
//    var audioPlayer = AVAudioPlayer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        songWidgetCollection.delegate = self
        songWidgetCollection.dataSource = self
        songWidgetCollection.register(UINib(nibName: "SongWidget", bundle: nil), forCellReuseIdentifier: "songWidgetCell")
        
        createWorkspace.layer.cornerRadius=8
//        self.songWidgetCollection.backgroundColor = UIColor.clear
        //load mp3
        
//        let sound = Bundle.main.path(forResource: "tothebone", ofType: "mp3")
//
//        do{
//            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
//        }
//        catch{
//            print(error)
//        }
//        songSlider.maximumValue = Float(audioPlayer.duration)
//        songSlider.setValue(0, animated: true)
    }

    
    //tableview
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songWidgetCell") as! SongWidget
        cell.songName.text = "Untiled"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
            return CGFloat(150) //guide post
        
    }

   
    //action
//
//    @IBAction func playSound(_ sender: Any) {
//        audioPlayer.play()
//        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
//    }
//
//
//    @IBAction func stopSound(_ sender: Any) {
//        audioPlayer.stop()
//        audioPlayer.currentTime = 0
//    }
//
//
//    @IBAction func pauseSound(_ sender: Any) {
//        audioPlayer.pause()
//    }
//
//
//    @IBAction func songSliderMove(_ sender: UISlider) {
//        var minutes = songSlider.value/60
//        var seconds = Int(songSlider.value)%60
//        soundLength.text = NSString(format: "%02d:%02d", Int(minutes), seconds) as String
//        audioPlayer.stop()
//        audioPlayer.currentTime = TimeInterval(songSlider.value)
//        audioPlayer.prepareToPlay()
//        audioPlayer.play()
//    }
//
//    @objc func updateSlider(){
//        songSlider.setValue(Float(audioPlayer.currentTime), animated: true)
//
//        var minutes = songSlider.value/60
//        var seconds = Int(songSlider.value)%60
//        soundLength.text = NSString(format: "%02d:%02d", Int(minutes),seconds) as String
//    }
//
    
    
}


    

