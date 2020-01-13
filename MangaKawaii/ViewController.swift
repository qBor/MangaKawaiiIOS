//
//  ViewController.swift
//  MangaKawaii
//
//  Created by qBor on 12/01/2020.
//  Copyright © 2020 qBor. All rights reserved.
//

import UIKit
import WebKit
import Floaty

class ViewController: UIViewController {
    // Déclaration web
    let url = URL(string: "https://www.mangakawaii.to")

    // Préférence utilisateur
    let defaults = UserDefaults.standard
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
        floaty.sticky = true
        
        
        if (defaults.bool(forKey: "btnbackstatement") == true){
            
            floaty.addItem("Retour", icon: UIImage(named: "back"),handler: {_ in
                
                self.webView.goBack()
                
                
            })
            floaty.addItem("Avant", icon: UIImage(named: "forward"),handler: {_ in
                
                self.webView.goForward()
                
                
            })
        }
        else {}
        
        // item par défaut
        
        floaty.addItem("Paramètres",icon: UIImage(named:"settings" ), handler: {_ in
            
            self.performSegue(withIdentifier: "gotosettings", sender: self)
            
            
        })
       
       floaty.addItem("Favoris", icon: UIImage(named:"favorites" ) ,handler: {_ in
                   
                self.performSegue(withIdentifier: "gotofavoris", sender: self)
                   
           })
        
        

      
        
        // WebView qui permet l'affichage du site
       
        
        // Geste swipe
webView.allowsBackForwardNavigationGestures = true
        
        
    // Fonctionnement
        let urlRequest = URLRequest(url: url!)
        self.webView.load(urlRequest)
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshWebView(_:)), for: UIControl.Event.valueChanged)
        webView.scrollView.addSubview(refreshControl)
        webView.scrollView.bounces = true
        
        
         
       
    }
    
    
    
    // changelog page

    }


