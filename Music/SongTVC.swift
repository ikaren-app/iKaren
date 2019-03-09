//
//  SongTVC.swift
//  yk396_p4
//
//  Created by Artesia Ko on 10/22/18.
//  Copyright © 2018 Yanlam. All rights reserved.
//

import UIKit

class SongTVC: UITableViewCell {
    var nameLabel: UILabel!
    var artistLabel: UILabel!
    var albumLabel: UILabel!
    var imageLabel: UIImageView!
    var rect: UIImageView!
    var rect2: UIImageView!
    
    let pad: CGFloat = 13
    let height: CGFloat = 16
    let imageWidth: CGFloat = 55
    let imageHeight: CGFloat = 55
    
    let color = UIColor(red: 37/255, green: 77/255, blue: 142/255, alpha: 1.0)
    let color2 = UIColor(red: 1/255, green: 50/255, blue: 67/255, alpha: 1.0)
    let color3 = UIColor(red: 181/255, green: 209/255, blue: 255/255, alpha: 1.0)
    let color4 = UIColor(red: 181/255, green: 209/255, blue: 255/255, alpha: 0.65)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = color
        
        rect = UIImageView()
        rect.translatesAutoresizingMaskIntoConstraints = false
        rect.backgroundColor = color4
        rect.layer.cornerRadius = 10
        rect.layer.masksToBounds = true
        contentView.addSubview(rect)
        
        rect2 = UIImageView()
        rect2.translatesAutoresizingMaskIntoConstraints = false
        rect2.backgroundColor = color4
        rect2.layer.cornerRadius = 2
        rect2.layer.masksToBounds = true
        contentView.addSubview(rect2)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        nameLabel.textColor = .white
        contentView.addSubview(nameLabel)
        
        artistLabel = UILabel()
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        artistLabel.textColor = .white
        contentView.addSubview(artistLabel)
        
        albumLabel = UILabel()
        albumLabel.translatesAutoresizingMaskIntoConstraints = false
        albumLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        albumLabel.textColor = .white
        contentView.addSubview(albumLabel)
        
        imageLabel = UIImageView()
        imageLabel.image = UIImage(named: "defaultImage")
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        imageLabel.layer.borderWidth = 2
        imageLabel.layer.masksToBounds = true
        imageLabel.layer.borderColor = color3.cgColor
        imageLabel.layer.cornerRadius = imageWidth/2
        imageLabel.contentMode = .scaleAspectFill
        contentView.addSubview(imageLabel)
        
    }
    
    override func updateConstraints() {
        NSLayoutConstraint.activate([
            rect.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            rect.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            rect.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            rect.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
            ])
        NSLayoutConstraint.activate([
            imageLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: pad),
            imageLabel.heightAnchor.constraint(equalToConstant: imageHeight),
            imageLabel.widthAnchor.constraint(equalToConstant: imageWidth)
            ])
        NSLayoutConstraint.activate([
            rect2.leadingAnchor.constraint(equalTo: imageLabel.trailingAnchor, constant: pad-5),
            rect2.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            rect2.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -20),
            rect2.widthAnchor.constraint(equalToConstant: 1)
            ])
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: rect2.trailingAnchor, constant: pad),
            nameLabel.heightAnchor.constraint(equalToConstant: height+5)
            ])
        NSLayoutConstraint.activate([
            artistLabel.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -1),
            artistLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            artistLabel.heightAnchor.constraint(equalToConstant: height)
            ])
        NSLayoutConstraint.activate([
            albumLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 1),
            albumLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            albumLabel.heightAnchor.constraint(equalToConstant: height)
            ])
        super.updateConstraints()
    }
    
    func configure(for song: Song) {
        nameLabel.text = song.name
        artistLabel.text = song.artist
        albumLabel.text = song.album
        imageLabel.image = song.image
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
