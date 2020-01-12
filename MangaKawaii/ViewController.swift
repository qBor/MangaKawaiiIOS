//
//  ViewController.swift
//  MangaKawaii
//
//  Created by Kevin Fosse on 12/01/2020.
//  Copyright © 2020 Kevin Fosse. All rights reserved.
//

import UIKit
import WebKit
import Floaty

class ViewController: UIViewController {

    // Déclaration floaty
    @IBOutlet weak var floaty: Floaty!
    
    // Déclaration WKWeb
    
    @IBOutlet weak var webView: WKWebView!
    @objc
    func refreshWebView(_ sender: UIRefreshControl) {
        webView?.reload()
        sender.endRefreshing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Bar
        
        floaty.addItem(title:"Paramètres", handler: {_ in
            
            self.performSegue(withIdentifier: "gotosettings", sender: self)
            
        })
        self.view.addSubview(floaty)

      
        
        // WebView qui permet l'affichage du site
        let url = URL(string: "https://www.mangakawaii.to")
        let urlRequest = URLRequest(url: url!)
        self.webView.load(urlRequest)
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshWebView(_:)), for: UIControl.Event.valueChanged)
        webView.scrollView.addSubview(refreshControl)
        webView.scrollView.bounces = true
    }
    
}

