//
//  MusicTVC.swift
//  yk396_p4
//
//  Created by Artesia Ko on 10/25/18.
//  Copyright © 2018 Yanlam. All rights reserved.
//

import UIKit

class MusicTVC: UITableViewCell {
    
    var sName: UILabel!
    var sArtist: UILabel!
    var sAlbum: UILabel!
    var song: String = ""
    var sNum: UILabel!
    
    let color = UIColor(red: 37/255, green: 77/255, blue: 142/255, alpha: 1.0)
    let color2 = UIColor(red: 1/255, green: 50/255, blue: 67/255, alpha: 1.0)
    let color3 = UIColor(red: 181/255, green: 209/255, blue: 255/255, alpha: 1.0)
    let color4 = UIColor(red: 181/255, green: 209/255, blue: 255/255, alpha: 0.65)
    let color5 = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
    let color6 = UIColor(red: 197/255, green: 239/255, blue: 247/255, alpha: 1.0)
    
    let pad: CGFloat = 8

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        
        sNum = UILabel()
        sNum.translatesAutoresizingMaskIntoConstraints = false
        sNum.font = UIFont.systemFont(ofSize: 16, weight: .light)
        sNum.textColor = .white
        contentView.addSubview(sNum)
        
        sName = UILabel()
        sName.translatesAutoresizingMaskIntoConstraints = false
        sName.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        sName.textColor = .white
        contentView.addSubview(sName)
        
        sArtist = UILabel()
        sArtist.translatesAutoresizingMaskIntoConstraints = false
        sArtist.font = UIFont.systemFont(ofSize: 12, weight: .light)
        sArtist.textColor = .white
        contentView.addSubview(sArtist)
        
        sAlbum = UILabel()
        sAlbum.translatesAutoresizingMaskIntoConstraints = false
        sAlbum.font = UIFont.systemFont(ofSize: 12, weight: .light)
        sAlbum.textColor = .white
        contentView.addSubview(sAlbum)
    
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            sNum.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            sNum.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: pad + 10),
            sNum.heightAnchor.constraint(equalToConstant: 21)
            ])
        NSLayoutConstraint.activate([
            sName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            sName.leadingAnchor.constraint(equalTo: sNum.trailingAnchor, constant: pad + 10),
            sName.heightAnchor.constraint(equalToConstant: 21)
            ])
        NSLayoutConstraint.activate([
            sArtist.bottomAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -1),
            sArtist.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -1 * pad),
            sArtist.heightAnchor.constraint(equalToConstant: 16)
            ])
        NSLayoutConstraint.activate([
            sAlbum.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 1),
            sAlbum.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -1 * pad),
            sAlbum.heightAnchor.constraint(equalToConstant: 16)
            ])
    }
    
    func configure(for so: Song) {
        sName.text = so.name
        sArtist.text = so.artist
        sAlbum.text = so.album
        song = so.mp3
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init coder not implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
