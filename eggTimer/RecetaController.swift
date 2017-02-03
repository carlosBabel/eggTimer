//
//  RecetaController.swift
//  eggTimer
//
//  Created by Carlos on 2/2/17.
//  Copyright © 2017 Chichiri Games. All rights reserved.
//

import UIKit

class RecetaController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var selectedReceta : Receta!

    
    @IBOutlet weak var lblNombre: UINavigationItem!
    @IBOutlet weak var imgReceta: UIImageView!
    
  
    let ingredientes = ["Arroz Blanco", "Aceite", "Sal", "Hoja de Laurel"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblNombre.title = selectedReceta.nombre
        imgReceta.image = UIImage(named: "\(selectedReceta.recetaID)")

        // Do any additional setup after loading the view.
 
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //lblNombre.title = String(receta.nombre)
        //imgReceta.image = UIImage(named: "\(receta.recetaID)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ingredientes.count
        
    }
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = IngredienteCell(style: UITableViewCellStyle.default, reuseIdentifier: "IngredienteCell")
        
        cell.textLabel?.text = ingredientes[indexPath.row]
        
        return cell
        
    }

    @IBAction func BotonAtrasPresionado(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
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
