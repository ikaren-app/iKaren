//
//  AudioPlayerVC.swift
//  UKaren
//
//  Created by Ehlu Moo on 4/1/19.
//  Copyright © 2019 Ehkalu Moo. All rights reserved.
//





import UIKit
import AVFoundation

class AudioPlayerVC: UIViewController, AVSpeechSynthesizerDelegate  {
    
    var trackID: Int!
    var audioPlayer:AVAudioPlayer!
    
    
    @IBOutlet var trackLbl: UILabel!
    
    
    @IBOutlet var progressView: UIProgressView!
    var timer = Timer()
    
    let speechSynthesizer = AVSpeechSynthesizer()
    /*
     func scheduledTimerWithTimeInterval(){
     // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
     timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(AudioPlayerVC.updateCounting), userInfo: nil, repeats: true)
     }
     
     func updateCounting(){
     let timerRemain = audioPlayer.duration - audioPlayer.currentTime
     timeRemain.text = String(format:"%f", (timerRemain))
     timePlay.text = String(format:"%f", (audioPlayer.currentTime))
     if(audioPlayer.currentTime <= 0) {
     UIView.animate(withDuration: 2.0, animations: {
     self.trackLbl.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
     })
     }
     }
     */
    @IBAction func skip(_ sender: Any) {
        audioPlayer.stop();
        trackID = trackID + 1
        if(trackID >= 6) {
            trackID = 0
        }
        trackLbl.text = " Relaxing \(trackID + 1)"
        
        let path: String! = Bundle.main.resourcePath?.appending(" /\(trackID!).mp3")
        let mp3URL = NSURL(fileURLWithPath: path)
        do
        {
            // 2
            audioPlayer = try AVAudioPlayer(contentsOf: mp3URL as URL)
            audioPlayer.play()
            
            // 3
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateAudioProgressView), userInfo: nil, repeats: true)
            progressView.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: false)
        }
        catch
        {
            print("An error occurred while trying to extract audio file")
        }
    }
    @IBAction func preview(_ sender: Any) {
        audioPlayer.stop();
        trackID = trackID - 1
        if(trackID < 0) {
            trackID = 0
        }
        trackLbl.text = " Relaxing \(trackID + 1)"
        
        let path: String! = Bundle.main.resourcePath?.appending("/\(trackID!).mp3")
        let mp3URL = NSURL(fileURLWithPath: path)
        do
        {
            // 2
            audioPlayer = try AVAudioPlayer(contentsOf: mp3URL as URL)
            audioPlayer.play()
            audioPlayer.numberOfLoops = -1
            // 3
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateAudioProgressView), userInfo: nil, repeats: true)
            progressView.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: false)
        }
        catch
        {
            print("An error occurred while trying to extract audio file")
        }
    }
    /*
     @IBAction func fastBackward(_ sender: AnyObject) {
     var time: TimeInterval = audioPlayer.currentTime
     time = 0 // Go back by 5 seconds
     if time < 0
     {
     stop(self)
     }else
     {
     audioPlayer.currentTime = time
     }
     }
     */
    @IBAction func pause(_ sender: AnyObject) {
        audioPlayer.pause()
        
    }
    @IBAction func play(_ sender: AnyObject) {
        audioPlayer.play()
        
        
    }
    /*
     @IBAction func stop(_ sender: AnyObject) {
     audioPlayer.stop()
     audioPlayer.currentTime = 0
     progressView.progress = 0.0
     }
     
     @IBAction func Speed(_ sender: Any) {
     audioPlayer.stop();
     audioPlayer.enableRate = true
     if(audioPlayer.rate == 1.0) {
     audioPlayer.rate = 2.0
     speedbtn.setTitle("Speed 2.0", for: .normal)
     
     }
     else if(audioPlayer.rate == 2.0) {
     audioPlayer.rate = 0.5
     speedbtn.setTitle("Speed 0.5", for: .normal)
     }
     else if(audioPlayer.rate == 0.5) {
     audioPlayer.rate = 1.0
     speedbtn.setTitle("Speed 1.0", for: .normal)
     }
     audioPlayer.play()
     }
     
     @IBAction func fastForward(_ sender: AnyObject) {
     var time: TimeInterval = audioPlayer.currentTime
     time += 5.0 // Go forward by 5 seconds
     if time > audioPlayer.duration
     {
     stop(self)
     }else
     {
     audioPlayer.currentTime = time
     }
     }
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        var nowPlaying: String!
        
        nowPlaying = ""
        let utterance = AVSpeechUtterance(string: nowPlaying)
        
        
        
        
        speechSynthesizer.delegate = self
        speechSynthesizer.speak(utterance)
        
        
        
    }
    
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        print("yeehaa..!!")
        trackLbl.text = " \(trackID + 1)"
        // 1
        let path: String! = Bundle.main.resourcePath?.appending("/\(trackID!).mp3")
        let mp3URL = NSURL(fileURLWithPath: path)
       
        do
        {
            // 2
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayer = try AVAudioPlayer(contentsOf: mp3URL as URL)
            audioPlayer.play()
            // 3
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateAudioProgressView), userInfo: nil, repeats: true)
            progressView.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: false)
        }
        catch
        {
            print("An error occurred while trying to extract audio file")
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        audioPlayer.stop()
    }
    
    @objc func updateAudioProgressView()
    {
        if audioPlayer.isPlaying
        {
            // Update progress
            progressView.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: true)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}
