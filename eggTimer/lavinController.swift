//
//  lavinController.swift
//  eggTimer
//
//  Created by Carlos on 2/2/17.
//  Copyright © 2017 Chichiri Games. All rights reserved.
//

import UIKit

class lavinController: UIViewController {

    var prueba : String!
    @IBOutlet weak var lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(prueba)
        lbl.text = prueba
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
