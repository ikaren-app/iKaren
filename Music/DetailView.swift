//
//  DetailView.swift
//  yk396_p4
//
//  Created by Artesia Ko on 10/23/18.
//  Copyright © 2018 Yanlam. All rights reserved.
//

import UIKit
import AVFoundation

protocol changeSong: class {
    func songC(ns: String)
}

class DetailView: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    weak var delegate: changeTitle?
    
    var alert: UIAlertController!
    var name: UITextField!
    var artist: UITextField!
    var album: UITextField!
    var image: UIImageView!
    
    var cir: UIImageView!
    var cir2: UIImageView!
    
    var saveButton: UIButton!
    var backButton: UIButton!
    var imageButton: UIButton!
    var musicButton: UIButton!
    
    var tName: String = "default"
    var tArtist: String = "default"
    var tAlbum: String = "default"
    var i: UIImage = UIImage(named: "defaultImage")!
    var s: String = "default"
   
    let nameHeight: CGFloat = 40
    let artistHeight: CGFloat = 25
    let albumHeight: CGFloat = 25
    let color = UIColor(red: 37/255, green: 77/255, blue: 142/255, alpha: 1.0)
    let color2 = UIColor(red: 1/255, green: 50/255, blue: 67/255, alpha: 1.0)
    let color3 = UIColor(red: 181/255, green: 209/255, blue: 255/255, alpha: 1.0)
    let color4 = UIColor(red: 181/255, green: 209/255, blue: 255/255, alpha: 0.65)
    
    var player: AVAudioPlayer = AVAudioPlayer()
    var play: UIButton!
    var musicSlider: UISlider!
    var audioBackward: UIButton!
    var audioForward: UIButton!
    var isPlaying: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        //rgba(197, 239, 247, 1)
        view.backgroundColor = color
        do {
            player = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: s, ofType: "mp3")!))
        }
        catch {
        }
        
        musicSlider = UISlider()
        musicSlider.translatesAutoresizingMaskIntoConstraints = false
        musicSlider.minimumValue = 0
        musicSlider.maximumValue = Float(player.duration)
        musicSlider.addTarget(self, action: #selector(changedTime), for: .allTouchEvents)
        musicSlider.thumbTintColor = color3
        musicSlider.minimumTrackTintColor = color3
        musicSlider.maximumTrackTintColor = color4
        view.addSubview(musicSlider)
        
        _ = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updatemusicSlider), userInfo: nil, repeats: true)
        
        play = UIButton()
        play.translatesAutoresizingMaskIntoConstraints = false
        play.backgroundColor = .clear
        play.setImage(UIImage(named:"play"), for: .normal)
        play.contentMode = .scaleAspectFit
        play.alpha = 0.75
        play.addTarget(self, action: #selector(playMusic), for: .touchDown)
        view.addSubview(play)
        
        audioForward = UIButton()
        audioForward.translatesAutoresizingMaskIntoConstraints = false
        audioForward.backgroundColor = .clear
        audioForward.setImage(UIImage(named:"audio.forward"), for: .normal)
        audioForward.contentMode = .scaleAspectFit
        audioForward.alpha = 0.75
        audioForward.addTarget(self, action: #selector(forward), for: .touchDown)
        view.addSubview(audioForward)
        
        audioBackward = UIButton()
        audioBackward.translatesAutoresizingMaskIntoConstraints = false
        audioBackward.backgroundColor = .clear
        audioBackward.setImage(UIImage(named:"audio.backward"), for: .normal)
        audioBackward.contentMode = .scaleAspectFit
        audioBackward.alpha = 0.75
        audioBackward.addTarget(self, action: #selector(backward), for: .touchDown)
        view.addSubview(audioBackward)
        
        cir = UIImageView()
        cir.translatesAutoresizingMaskIntoConstraints = false
        cir.backgroundColor = color3
        cir.layer.masksToBounds = true
        cir.layer.cornerRadius = (view.frame.width - 30)/2
        cir.alpha = 0.5
        view.addSubview(cir)
        
        cir2 = UIImageView()
        cir2.translatesAutoresizingMaskIntoConstraints = false
        cir2.backgroundColor = color3
        cir2.layer.masksToBounds = true
        cir2.layer.cornerRadius = (view.frame.width - 20)/2
        cir2.alpha = 0.5
        view.addSubview(cir2)
        
        image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = i
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = (view.frame.width - 50)/2
        image.layer.masksToBounds = true
        image.layer.borderWidth = 15
        image.layer.borderColor = color3.cgColor
        view.addSubview(image)
        
        imageButton = UIButton()
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        imageButton.setImage(UIImage(named: "editImage"), for: .normal)
        imageButton.addTarget(self, action: #selector(pickImage), for: .touchDown)
        imageButton.contentMode = .scaleAspectFill
        imageButton.layer.masksToBounds = true
        view.addSubview(imageButton)
        
        musicButton = UIButton()
        musicButton.translatesAutoresizingMaskIntoConstraints = false
        musicButton.setImage(UIImage(named: "editSong"), for: .normal)
        musicButton.addTarget(self, action: #selector(pickMusic), for: .touchDown)
        musicButton.contentMode = .scaleAspectFill
        musicButton.layer.masksToBounds = true
        musicButton.alpha = 0.75
        view.addSubview(musicButton)
        
        name = UITextField()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.backgroundColor = .clear
        name.textColor = .white
        name.text = tName
        name.textAlignment = .center
        name.borderStyle = .none
        name.font = UIFont.boldSystemFont(ofSize: nameHeight-5)
        name.placeholder = "Title"
        name.clearsOnBeginEditing = true
        view.addSubview(name)
        
        artist = UITextField()
        artist.translatesAutoresizingMaskIntoConstraints = false
        artist.backgroundColor = .clear
        artist.textColor = color3
        artist.text = tArtist
        artist.textAlignment = .center
        artist.borderStyle = .none
        artist.placeholder = "Artist"
        artist.clearsOnBeginEditing = true
        artist.font = UIFont.systemFont(ofSize: artistHeight - 5, weight: .medium)
        view.addSubview(artist)
        
        album = UITextField()
        album.translatesAutoresizingMaskIntoConstraints = false
        album.backgroundColor = .clear
        album.textColor = color3
        album.text = tAlbum
        album.textAlignment = .center
        album.borderStyle = .none
        album.placeholder = "Album"
        album.clearsOnBeginEditing = true
        album.font = UIFont.systemFont(ofSize: albumHeight - 5, weight: .light)
        view.addSubview(album)
        
        saveButton = UIButton()
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.backgroundColor = .clear
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.addTarget(self, action: #selector(save), for: .touchDown)
        view.addSubview(saveButton)
        
        backButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.backgroundColor = .clear
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.contentMode = .scaleAspectFit
        backButton.addTarget(self, action: #selector(back), for: .touchDown)
        view.addSubview(backButton)
        
        alert = UIAlertController()
        alert.title = ""
        alert.message = ""
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: .none))

        setupConstraints()
    }
    
    @IBAction func pickMusic() {
        if (player.currentTime == 0) {
            player.currentTime = player.duration
        }
        player.stop()
        isPlaying = false
        play.setImage(UIImage(named: "play"), for: .normal)
        let musicList = MusicList()
        musicList.delegate = self
        self.present(musicList, animated: true, completion: nil)
    }
    
    @IBAction func pickImage() {
        let imagePC = UIImagePickerController()
        imagePC.allowsEditing = false
        imagePC.sourceType = .photoLibrary
        imagePC.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        imagePC.delegate = self
        present(imagePC, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
// Local variable inserted by Swift 4.2 migrator.
let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)

        let selectedImage = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as! UIImage
        image.image = selectedImage
        self.delegate?.imageChanged(newImage: selectedImage)
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func forward() {
        if (player.currentTime + 10 <= Double(musicSlider.maximumValue)) {
            player.currentTime += 10
        }
        else {
            player.currentTime = player.duration
        }
        play.setImage(UIImage(named: "pause"), for: .normal)
        player.play()
    }
    
    @IBAction func backward() {
        if (player.currentTime - 10 >= 0) {
            player.currentTime -= 10
        }
        else {
            player.currentTime = 0
        }
        play.setImage(UIImage(named: "pause"), for: .normal)
        player.play()
    }
    
    @IBAction func playMusic() {
        if (!isPlaying) {
            play.setImage(UIImage(named: "pause"), for: .normal)
            player.play()
        }
        else {
            play.setImage(UIImage(named: "play"), for: .normal)
            player.pause()
        }
        isPlaying = !isPlaying
    }
    
    @objc func updatemusicSlider() {
        musicSlider.value = Float(player.currentTime)
        if (musicSlider.value == 0) {
            play.setImage(UIImage(named: "pause"), for: .normal)
            player.play()
        }
    }
    
    @IBAction func changedTime() {
        player.stop()
        player.currentTime = TimeInterval(musicSlider.value)
        player.prepareToPlay()
        if (isPlaying) {
        player.play()
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 20),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
            ])
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20),
            image.heightAnchor.constraint(equalTo: view.widthAnchor, constant: -50),
            image.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        NSLayoutConstraint.activate([
            cir.centerYAnchor.constraint(equalTo: image.centerYAnchor),
            cir.heightAnchor.constraint(equalTo: image.heightAnchor, constant: 20),
            cir.widthAnchor.constraint(equalTo: image.widthAnchor, constant: 20),
            cir.centerXAnchor.constraint(equalTo: image.centerXAnchor)
            ])
        NSLayoutConstraint.activate([
            cir2.centerYAnchor.constraint(equalTo: cir.centerYAnchor),
            cir2.heightAnchor.constraint(equalTo: cir.heightAnchor, constant: 10),
            cir2.widthAnchor.constraint(equalTo: cir.widthAnchor, constant: 10),
            cir2.centerXAnchor.constraint(equalTo: cir.centerXAnchor)
            ])
        NSLayoutConstraint.activate([
            imageButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageButton.heightAnchor.constraint(equalToConstant: 20),
            imageButton.widthAnchor.constraint(equalToConstant: 20),
            imageButton.trailingAnchor.constraint(equalTo: saveButton.leadingAnchor, constant: -20)
            ])
        NSLayoutConstraint.activate([
            musicButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            musicButton.heightAnchor.constraint(equalToConstant: 20),
            musicButton.widthAnchor.constraint(equalToConstant: 20),
            musicButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: cir2.bottomAnchor, constant: 20),
            name.heightAnchor.constraint(equalToConstant: nameHeight),
            name.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            name.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20)
            ])
        NSLayoutConstraint.activate([
            artist.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 2),
            artist.heightAnchor.constraint(equalToConstant: artistHeight),
            artist.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -2.5),
            artist.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 20 - 2.5)
            ])
        NSLayoutConstraint.activate([
            album.centerYAnchor.constraint(equalTo: artist.centerYAnchor),
            album.heightAnchor.constraint(equalToConstant: albumHeight),
            album.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 2.5),
            album.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 20 - 2.5)
            ])
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            saveButton.heightAnchor.constraint(equalToConstant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
        NSLayoutConstraint.activate([
            play.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            play.heightAnchor.constraint(equalToConstant: 35),
            play.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            play.widthAnchor.constraint(equalToConstant: 35)
            ])
        NSLayoutConstraint.activate([
            audioForward.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            audioForward.heightAnchor.constraint(equalToConstant: 35),
            audioForward.leadingAnchor.constraint(equalTo: play.trailingAnchor, constant: 20),
            audioForward.widthAnchor.constraint(equalToConstant: 35)
            ])
        NSLayoutConstraint.activate([
            audioBackward.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            audioBackward.heightAnchor.constraint(equalToConstant: 35),
            audioBackward.trailingAnchor.constraint(equalTo: play.leadingAnchor, constant: -20),
            audioBackward.widthAnchor.constraint(equalToConstant: 35)
            ])
        NSLayoutConstraint.activate([
            musicSlider.bottomAnchor.constraint(equalTo: play.topAnchor, constant: -20),
            musicSlider.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40),
            musicSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            musicSlider.heightAnchor.constraint(equalToConstant: 20)
            ])
    }

    @objc func back() {
        player.stop()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func save() {
        alert.message = ""
        self.delegate?.songChanged(newSong: s)
        if let nameText = name.text, nameText != "" {
            self.delegate?.nameChanged(newTitle: nameText)
        }
        if let artistText = artist.text, artistText != "" {
            self.delegate?.artistChanged(newTitle: artistText)
        }
        if let albumText = album.text, albumText != "" {
            self.delegate?.albumChanged(newTitle: albumText)
        }
        
        if (name.text == "") {
            alert.message = alert.message! + "Please input a [String] for the name of the song."
            name.text = tName
        }
        if (artist.text == "") {
            alert.message = alert.message! + "\nPlease input a [String] for the artist name."
            artist.text = tArtist
        }
        if (album.text == "") {
            alert.message = alert.message! + "\nPlease input a [String] for the album name."
            album.text = tAlbum
        }
        if (alert.message != "") {
            self.present(alert, animated: true)
        }
        else {
            player.stop()
            dismiss(animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension DetailView: changeSong {
    func songC(ns: String) {
        s = ns
        do {
            player = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: ns, ofType: "mp3")!))
        }
        catch {
        }
        musicSlider.maximumValue = Float(player.duration)
        play.setImage(UIImage(named: "pause"), for: .normal)
        isPlaying = true
        player.play()
        //self.delegate?.songChanged(newSong: ns)
    }
}










// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
	return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
	return input.rawValue
}
