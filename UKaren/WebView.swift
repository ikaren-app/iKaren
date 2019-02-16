//
//  WebView.swift
//  UKaren
//
//  Created by Ehlu Moo on 2/16/19.
//  Copyright © 2019 Ehkalu Moo. All rights reserved.
//

import Foundation
import WebKit

class WebView: UIViewController {
    
    @IBOutlet weak var myWeb: UIWebView!
    let web = URL(string: "http://uploadinsert.x10host.com/createUpload-master/addnew.php")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let request =  URLRequest(url: web!)
       myWeb.loadRequest(request);
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}

