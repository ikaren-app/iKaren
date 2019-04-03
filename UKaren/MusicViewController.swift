//
//  MusicViewController.swift
//  UKaren
//
//  Created by Ehlu Moo on 4/1/19.
//  Copyright © 2019 Ehkalu Moo. All rights reserved.
//

import UIKit

class MusicViewController: UITableViewController {
    
    var track: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Table View DataSource
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "CellID")
        cell?.textLabel?.text = "Relaxing \(indexPath.row + 1)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    
    // Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        track = indexPath.row
        performSegue(withIdentifier: "MoveToAudioPlayer", sender: self)
    }
    
    // Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let audioPlayerVC = segue.destination as! AudioPlayerVC
        audioPlayerVC.trackID = track
    }
}

