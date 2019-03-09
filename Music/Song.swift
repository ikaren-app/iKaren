//
//  Song.swift
//  yk396_p4
//
//  Created by Artesia Ko on 10/22/18.
//  Copyright © 2018 Yanlam. All rights reserved.
//

import Foundation
import UIKit
/*
 Create a UITableView with custom cells to display a playlist of songs.
 Required to create a custom cell with an image, song name, artist name and album name.
 Reuse table view cells (using dequeueReusableCell(withIdentifier:)), and have a minimum of 10 songs for testing purposes.
 Create your custom cells by subclassing UITableViewCell.
 Ability to edit the songs in the playlist (change the song
 name, artists name and album name): use detail view that appears when you tap on a cell.
 Remember the MVC paradigm and use it. For example, you should have some model that keeps
 track of each song’s information in the playlist.
 */
class Song {
    var name: String
    var artist: String
    var album: String
    var image: UIImage!
    var mp3: String
    
    init (name: String, artist: String, album: String, image: UIImage, mp3: String) {
        self.name = name
        self.artist = artist
        self.album = album
        self.image = image
        self.mp3 = mp3
        
    }
    
    
}
