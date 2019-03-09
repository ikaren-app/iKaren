//
//  ViewController.swift
//  yk396_p4
//
//  Created by Artesia Ko on 10/22/18.
//  Copyright © 2018 Yanlam. All rights reserved.
//

import UIKit

protocol changeTitle: class {
    func nameChanged(newTitle: String)
    func artistChanged(newTitle: String)
    func albumChanged(newTitle: String)
    func imageChanged(newImage: UIImage)
    func songChanged(newSong: String)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView!
    var songs: [Song]!
    var selectedCell: SongTVC!
    var selectedSong: Song!
    var n: Int!
    var addButton: UIButton!
    var editB: UIBarButtonItem!
    
    let reuseIdentifier = "songCellReuse"
    let cellHeight: CGFloat = 90
    let addButtonImage: String = "add"
    let editButtonImage: String = "edit"
    
    let color = UIColor(red: 37/255, green: 77/255, blue: 142/255, alpha: 1.0)
    let color2 = UIColor(red: 1/255, green: 50/255, blue: 67/255, alpha: 1.0)
    let color3 = UIColor(red: 181/255, green: 209/255, blue: 255/255, alpha: 1.0)
    let color4 = UIColor(red: 181/255, green: 209/255, blue: 255/255, alpha: 0.65)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Playlist"

        //view.backgroundColor = UIColor(red: 70/255, green: 86/255, blue: 85/255, alpha: 1.0)
        //rgba(1, 50, 67, 1)rgba(197, 239, 247, 1)
        view.backgroundColor = color
        
        let song1 = Song(name: "Centuries", artist: "Fall Out Boy", album: "American Beauty/American Psycho", image: UIImage(named: "image.centuries")!, mp3: "centuries")
        let song2 = Song(name: "Song2", artist: "A2", album: "al2", image: UIImage(named: "gradgb")!, mp3: "relax")
        let song3 = Song(name: "Song3", artist: "A3", album: "al3", image: UIImage(named: "gradpb")!, mp3: "relax2")
        let song4 = Song(name: "Rain", artist: "-", album: "-", image: UIImage(named: "image.rain")!, mp3: "rain")
        let song5 = Song(name: "Startup", artist: "-", album: "-", image: UIImage(named: "image.winterFlower")!, mp3: "default")
        let song6 = Song(name: "Shallow", artist: "Lady Gaga & Bradley Cooper", album: "A Star Is Born", image: UIImage(named: "image.shallow")!, mp3: "starIsBorn")
        let song7 = Song(name: "Name of Life", artist: "Joe Hisaishi", album: "Spirited Away", image: UIImage(named: "image.spirited")!, mp3: "nameOfLife")
        let song8 = Song(name: "One Summer's Day", artist: "Joe Hisaishi", album: "Spirited Away", image: UIImage(named: "image.spirited")!, mp3: "summersDay")
        let song10 = Song(name: "Pokemon", artist: "Jason Paige", album: "Pokemon", image: UIImage(named: "image.pokemon")!, mp3: "pokemon")
        let song9 = Song(name: "The Dragon Boy", artist: "Joe Hisaishi", album: "Spirited Away", image: UIImage(named: "image.spirited")!, mp3: "dragonBoy")
        songs = [song1, song2, song3, song4, song5, song6, song7, song8, song9, song10]
        
        tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SongTVC.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.backgroundColor = color
        tableView.isEditing = false
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        
        addButton = UIButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.backgroundColor = .clear
        addButton.setImage(UIImage(named: addButtonImage), for: .normal)
        addButton.contentMode = .scaleAspectFit
        addButton.alpha = 0.75
        addButton.addTarget(self, action: #selector(addSong), for: .touchDown)
        view.addSubview(addButton)
    
        editB = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(edit))
        self.navigationItem.rightBarButtonItem = editB
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            addButton.widthAnchor.constraint(equalToConstant: 55),
            addButton.heightAnchor.constraint(equalToConstant: 55),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
    }
    
    @objc func addSong() {
        let newSong = Song(name: "Title", artist: "Artist", album: "Album", image: UIImage(named: "defaultImage")!, mp3: "default")
        songs.append(newSong)
        tableView.beginUpdates()
        tableView.insertRows(at: [NSIndexPath(row: songs.count-1, section: 0) as IndexPath], with: .automatic)
        tableView.endUpdates()
        tableView.scrollToRow(at: NSIndexPath(row: songs.count-1, section: 0) as IndexPath, at: .bottom, animated: true)
    }
    
    @objc func edit() {
        tableView.isEditing = !tableView.isEditing
        if (editB.title == "Edit") {
            editB.title = "Done"
            addButton.isHidden = true
        }
        else {
            editB.title = "Edit"
            addButton.isHidden = false
        }
    }
    
    //delete cell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            songs.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    //move cell
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let obj = songs[sourceIndexPath.row]
        songs.remove(at: sourceIndexPath.row)
        songs.insert(obj, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SongTVC
        let song = songs[indexPath.row]
        cell.configure(for: song)
        cell.setNeedsUpdateConstraints()
        cell.selectionStyle = .none
        cell.backgroundColor = color
        return cell
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    //what happens when a cell is clicked
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCell = tableView.cellForRow(at: indexPath) as? SongTVC
        _ = tableView.cellForRow(at: indexPath) as? SongTVC
        n = indexPath.row
        let song = songs[indexPath.row]
        selectedSong = songs[indexPath.row]
        let songView = DetailView()
        songView.delegate = self
        songView.tName = song.name
        songView.tAlbum = song.album
        songView.tArtist = song.artist
        songView.i = song.image
        songView.s = song.mp3
        self.present(songView, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: changeTitle {
    func imageChanged(newImage: UIImage) {
        selectedCell.imageLabel.image = newImage
        songs[n].image = newImage
    }
    func nameChanged(newTitle: String) {
        selectedCell.nameLabel.text = newTitle
        songs[n].name = newTitle
    }
    func artistChanged(newTitle: String) {
        selectedCell.artistLabel.text = newTitle
        songs[n].artist = newTitle
    }
    func albumChanged(newTitle: String) {
        selectedCell.albumLabel.text = newTitle
        songs[n].album = newTitle
    }
    func songChanged(newSong: String) {
        songs[n].mp3 = newSong
    }
}

