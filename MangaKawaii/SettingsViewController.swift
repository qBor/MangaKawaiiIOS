//
//  SettingsViewController.swift
//  MangaKawaii
//
//  Created by qBor on 12/01/2020.
//  Copyright © 2020 qBor. All rights reserved.
//

import UIKit
import WebKit

class SettingsViewController: UIViewController {
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    let defaults = UserDefaults.standard
    let gurl = URL(string: "https://www.hackingwithswift.com")
   
// version url
    
    // Label version déclaration
    
    @IBOutlet weak var versionlabel: UILabel!
    
    // changelog

    
    @IBOutlet weak var switchbtn: UISwitch!
    
    // Activer les boutons retour
    @IBAction func switchbtnaction(_ sender: UISwitch) {
        defaults.set(sender.isOn, forKey: "btnbackstatement")
    }
    
    // chercher une mise a jour
    
    
    @IBAction func checkforUpdate(_ sender: Any) {
        let url = URL(string: "https://raw.githubusercontent.com/qBor/MangaKawaiiIOS/master/version.txt")

          do {
              let versionContent = try String(contentsOf: url!, encoding: .utf8)
            print(versionContent)
            if versionContent != appVersion {
                
                let alert = UIAlertController(title: "Mise à jour", message: "Une mise à jour est disponible sur le GitHub", preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "Oui", style: .default ,handler: {
                    (action) in
                    UIApplication.shared.open(URL(string: "http://www.github.com/qBor/MangaKawaiiIOS")!, options: [:], completionHandler: nil)
                    NSLog("Opening link")
                }))
                alert.addAction(UIAlertAction(title: "Non", style: .cancel, handler: nil))

                self.present(alert, animated: true)
            }
            else {
                let alert = UIAlertController(title: "Mise à jour", message: "Aucune mise à jour n'est disponible", preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

                self.present(alert, animated: true)
            }
          }

          catch {
              print("error")
          }
    }
    
    // Crédits
    
    @IBAction func credits(_ sender: Any) {
        let alert = UIAlertController(title:"Crédits", message:"@qBor \n@kciter pour le framework Floaty \n L'équipe de MangaKawaii \n Google c:", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Retour", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    // mailto
    @IBAction func contactforfix(_ sender: Any) {
        let email = "kevxxf@tutanota.com"
        if let url = URL(string: "mailto:\(email)") {
          if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
          } else {
            UIApplication.shared.openURL(url)
          }
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //label update version
        
        
        
        // Activer les boutons
        
        switchbtn.isOn = defaults.bool(forKey: "btnbackstatement")
        
        // WebView qui permet l'affichage du changelog
        
             
           
     
    }
    
    
    // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


