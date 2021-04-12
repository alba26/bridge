//
//  SongWidget.swift
//  bridge_proto
//
//  Created by Adhitya Laksamana Bayu Adrian on 10/04/21.
//

import UIKit
import AVFoundation


class SongWidget: UITableViewCell {

    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var songSlider: UISlider!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var songLength: UILabel!
    
    var flag = 1
    
    var audioPlayer = AVAudioPlayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        songLength.isHidden = true
        let sound = Bundle.main.path(forResource: "tothebone", ofType: "mp3")
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        catch{
            print(error)
        }
        songSlider.maximumValue = Float(audioPlayer.duration)
        songSlider.setValue(0, animated: true)
    }
        
        
    
    @IBAction func playSong(_ sender: Any) {
        if flag == 1{
            flag = 2
            audioPlayer.play()
            songLength.isHidden = false
            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
        }else{
            playPauseButton.setImage(UIImage(systemName: "pause" ), for: .normal)
        }
        
    }
    
    @IBAction func stopSong(_ sender: Any) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
    }
    
    @IBAction func songSliderAnimation(_ sender: Any) {
//        let minutes = songSlider.value/60
//        let seconds = Int(songSlider.value)%60
//        songLength.text = NSString(format: "%02d : %02d", Int(minutes), seconds) as String
        audioPlayer.stop()
        audioPlayer.currentTime = TimeInterval(songSlider.value)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
    }
    @objc func updateSlider(){
        songSlider.setValue(Float(audioPlayer.currentTime), animated: true)
        let minutes = songSlider.value/60
        let seconds = Int(songSlider.value)%60
        songLength.text = NSString(format: "%02d : %02d", Int(minutes),seconds) as String
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
