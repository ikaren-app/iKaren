//
//  MusicList.swift
//  yk396_p4
//
//  Created by Artesia Ko on 10/25/18.
//  Copyright © 2018 Yanlam. All rights reserved.
//

import UIKit

class MusicList: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate {
    
    weak var delegate: changeSong?
    
    var tableView: UITableView!
    var songs: [Song]!
    var selectedCell: MusicTVC!
    var label: UILabel!
    
    let reuseIdentifier = "songCellReuse"
    let cellHeight: CGFloat = 50
    //rgba(44, 62, 80, 1)
    
    let color = UIColor(red: 37/255, green: 77/255, blue: 142/255, alpha: 1.0)
    let color2 = UIColor(red: 1/255, green: 50/255, blue: 67/255, alpha: 1.0)
    let color3 = UIColor(red: 181/255, green: 209/255, blue: 255/255, alpha: 1.0)
    let color4 = UIColor(red: 181/255, green: 209/255, blue: 255/255, alpha: 0.65)
    let color5 = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
    let color6 = UIColor(red: 107/255, green: 185/255, blue: 240/255, alpha: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = color5
        
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Music Archive"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        view.addSubview(label)
        
        let song1 = Song(name: "Centuries", artist: "Fall Out Boy", album: "American Beauty/American Psycho", image: UIImage(named: "image.centuries")!, mp3: "centuries")
        let song2 = Song(name: "Song2", artist: "A2", album: "al2", image: UIImage(named: "gradgb")!, mp3: "relax")
        let song3 = Song(name: "Song3", artist: "A3", album: "al3", image: UIImage(named: "gradpb")!, mp3: "relax2")
        let song4 = Song(name: "Rain", artist: "-", album: "-", image: UIImage(named: "image.rain")!, mp3: "rain")
        let song5 = Song(name: "Startup", artist: "-", album: "-", image: UIImage(named: "image.winterFlower")!, mp3: "default")
        let song6 = Song(name: "Shallow", artist: "Lady Gaga & Bradley Cooper", album: "A Star Is Born", image: UIImage(named: "image.shallow")!, mp3: "starIsBorn")
        let song7 = Song(name: "Name of Life", artist: "Joe Hisaishi", album: "Spirited Away", image: UIImage(named: "image.spirited")!, mp3: "nameOfLife")
        let song8 = Song(name: "One Summer's Day", artist: "Joe Hisaishi", album: "Spirited Away", image: UIImage(named: "image.spirited")!, mp3: "summersDay")
        let song10 = Song(name: "Pokemon Theme", artist: "Jason Paige", album: "Pokemon", image: UIImage(named: "image.pokemon")!, mp3: "pokemon")
        let song9 = Song(name: "The Dragon Boy", artist: "Joe Hisaishi", album: "Spirited Away", image: UIImage(named: "image.spirited")!, mp3: "dragonBoy")
        songs = [song1, song2, song3, song4, song5, song6, song7, song8, song9, song10]
        
        tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MusicTVC.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.backgroundColor = color5
        tableView.isEditing = false
        tableView.separatorStyle = .none
        //tableView.separatorColor = color6
        view.addSubview(tableView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.heightAnchor.constraint(equalToConstant: 30)
            ])
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCell = tableView.cellForRow(at: indexPath) as? MusicTVC
        let songText: String = songs[indexPath.row].mp3
        self.delegate?.songC(ns: songText)
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MusicTVC
        let song = songs[indexPath.row]
        cell.configure(for: song)
        cell.setNeedsUpdateConstraints()
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.sNum.text = String(indexPath.row + 1)
        if (Int(indexPath.row) % 2 == 0) {
            cell.backgroundColor = color6
        }
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}






