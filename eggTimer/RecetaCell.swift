//
//  RecetaCell.swift
//  eggTimer
//
//  Created by Carlos on 2/2/17.
//  Copyright © 2017 Chichiri Games. All rights reserved.
//

import UIKit

class RecetaCell: UICollectionViewCell {
    
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var etiqueta: UILabel!
    
    var receta: Receta!
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell(_ receta: Receta) {
        self.receta = receta

        etiqueta.text = self.receta.nombre.capitalized
        imagen.image = UIImage.init(named: "\(self.receta.recetaID)")
        
    }
}
