//
//  InicioController.swift
//  eggTimer
//
//  Created by Carlos on 2/2/17.
//  Copyright © 2017 Chichiri Games. All rights reserved.
//

import UIKit
import Alamofire

class InicioController: UIViewController, UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var recetas : [Receta] = []
    var recetasFiltradas : [Receta] = []
    var inSearchMode = false
    
    var receta: Receta!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.downloadRecetasData {
            self.collection.dataSource = self
            self.collection.delegate = self
            self.searchBar.delegate = self
            //self.collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "RecetaCell")
        }
        
        

        // Do any additional setup after loading the view.
    }
    
    func downloadRecetasData(completed: @escaping DownloadComplete){
        
        /*let headers: HTTPHeaders = [
            "X-Mashape-Key": "YMOEOFDEJtmsh6zp1SEXqOebU1QSp1mfdpPjsnUdiXOZJ03WPM",
            "Accept": "application/json"
        ]*/
        let RecetasURL = "\(URL_BASE)"
        //Downloading forecast weather data for TableView

        Alamofire.request(RecetasURL)
            .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
                print("Progress: \(progress.fractionCompleted)")
            }
            .validate { request, response, data in
                // Custom evaluation closure now includes data (allows you to parse data to dig out error messages if necessary)
                return .success
            }
            .responseJSON { response in
  

                if let dict = response.result.value as? [Dictionary<String, AnyObject>] , dict.count > 0 {
                    for receta in dict {
                        if let nombre = receta["nombre"] as? String {
                            if let recetaID = receta["idReceta"] as? String {
                                let f = Receta(nombre: nombre, recetaID: recetaID)

                                self.recetas.append(f)
                                
                            }
                        }
                        
                    }
                    completed()
                    
                }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            view.endEditing(true)
            collection.reloadData()
            
        } else {
            inSearchMode = true
            
            let lower = searchBar.text!.lowercased()
            
            recetasFiltradas = recetas.filter({ receta in receta.nombre.lowercased().contains(lower)})
            
            collection.reloadData()
        }
        
        
    }
    

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if(inSearchMode){
            return recetasFiltradas.count
        }
        return recetas.count
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecetaCell", for: indexPath) as? RecetaCell {
            
            let receta : Receta!
            
            if inSearchMode{
                receta = recetasFiltradas[indexPath.row]
            } else {
                receta = recetas[indexPath.row]
            }
            
            cell.configureCell(receta)
            
            return cell
            
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var receta: Receta!
        print("ENTRO")
        
        if inSearchMode {
            receta = recetasFiltradas[indexPath.row]
        } else {
            receta = recetas[indexPath.row]
        }
        
        
        performSegue(withIdentifier: "segueReceta", sender: receta)
    }
    

    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        
        return true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 224)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueReceta" {
            if let vc = segue.destination as? RecetaController {
 
                if let recetaCell: RecetaCell = sender as? RecetaCell {
                    vc.selectedReceta = recetaCell.receta
                }

                
                
                
            }
        }
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
