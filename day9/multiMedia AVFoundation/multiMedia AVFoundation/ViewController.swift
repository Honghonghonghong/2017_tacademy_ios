//
//  ViewController.swift
//  multiMedia AVFoundation
//
//  Created by Tacademy-Mac on 2017. 1. 12..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AVAudioPlayerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var durationLabel: UILabel!
    
    var musicList: [URL]!
    var player: AVAudioPlayer!
    var timer: Timer!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MUSIC_CELL", for: indexPath)
        
        cell.textLabel?.text = "Music \(indexPath.row)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = musicList[indexPath.row]
        
        showMusicInfo(url: url)
    }

    
    
    @IBAction func togglePlay(_ sender: Any) {
        
        // 정지시키기
        if player != nil && player.isPlaying{
            if timer != nil {
                timer.invalidate()
            }
            
            let button = sender as! UIButton
            button.setTitle("재생", for: .normal)
            
            player.stop()
        }
        //재생
        else {
            var selected: Int = 0
            if let index = tableView.indexPathForSelectedRow{
                selected = index.row
            }
            
            let url = musicList[selected]
            
            do {
                try player = AVAudioPlayer(contentsOf: url)
            }
            catch {
                print("AVAudioPlayer error")
                return
            }
            
            player.delegate = self
            
            if player.prepareToPlay() {
                player.play()
            }
            
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(handleTimer), userInfo: nil, repeats: true)
            
            // 재생 버튼의 제목 변경
            let button = sender as! UIButton
            button.setTitle("중지", for: .normal)
            
            timeSlider.maximumValue = Float(player.duration)
            
            let min = Int(player.duration / 60)
            let sec = Int(player.duration.truncatingRemainder(dividingBy: 60))
            durationLabel.text = String(format: "%2d:%2d", min, sec)
            
            showMusicInfo(url: url)
            
        }
    }
    
    func showMusicInfo(url: URL){
        let asset = AVAsset(url: url)
        let metadata = asset.commonMetadata
        
        let titles = AVMetadataItem.metadataItems(from: metadata, withKey: AVMetadataCommonKeyTitle, keySpace: AVMetadataKeySpaceCommon)
        
        if titles.count > 0{
            let item = titles[0]
            titleLabel.text = item.stringValue
        }
        let artists = AVMetadataItem.metadataItems(from: metadata, withKey: AVMetadataCommonKeyArtist, keySpace: AVMetadataKeySpaceCommon)
        if artists.count > 0 {
            let item = artists[0]
            artistLabel.text = item.stringValue
        }

        let artworks = AVMetadataItem.metadataItems(from: metadata, withKey: AVMetadataCommonKeyArtwork, keySpace: AVMetadataKeySpaceCommon)
        if artworks.count > 0 {
            let item = artworks[0]
            let data = item.value as! Data
            let image = UIImage(data: data)
            artworkImageView.image = image
        }
    
    
    }
    
    func handleTimer(_ timer: Timer){
        timeSlider.value = Float(player.currentTime)
    }
    @IBAction func timeSliderTouchUp(_ sender: UISlider) {
        if player != nil{
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.handleTimer(_:)), userInfo: nil, repeats: true)
        }
    }
    @IBAction func timeSliderTouchDown(_ sender: UISlider) {
        if timer != nil{
            timer.invalidate()
        }
    }
    @IBAction func timeSliderChanged(_ sender: Any) {
        let slider = sender as! UISlider
        if player != nil {
            player.currentTime = TimeInterval(slider.value)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musicList = [Bundle.main.url(forResource: "music1", withExtension: "mp3")!,
                    Bundle.main.url(forResource: "music2", withExtension: "mp3")!,
                    Bundle.main.url(forResource: "music3", withExtension: "mp3")!]
    }
    
}
