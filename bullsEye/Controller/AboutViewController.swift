//
//  AboutViewController.swift
//  bullsEye
//
//  Created by Daniel Grychtoł on 30/04/2020.
//  Copyright © 2020 Daniel Grychtoł. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("mounted about screen")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true) {
            print("initializing goin back...")
        }
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
