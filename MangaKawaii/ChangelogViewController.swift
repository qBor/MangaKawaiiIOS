//
//  ChangelogViewController.swift
//  MangaKawaii
//
//  Created by qBor on 13/01/2020.
//  Copyright © 2020 qBor. All rights reserved.
//

import UIKit

class ChangelogViewController: UIViewController {

    @IBOutlet weak var changelogview: UITextView!
    @IBOutlet weak var currentV: UILabel!
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentV.text = "Version actuelle : " + appVersion!
        
        //
        let url = URL(string: "https://raw.githubusercontent.com/qBor/MangaKawaiiIOS/master/changelog.txt")

                 do {
                     let versionContent = try String(contentsOf: url!, encoding: .utf8)
                   print(versionContent)
                    changelogview.text = versionContent
                   }

                 catch {
                     print("error")
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

}
