//
//  Receta.swift
//  eggTimer
//
//  Created by Carlos on 2/2/17.
//  Copyright © 2017 Chichiri Games. All rights reserved.
//

import Foundation
import Alamofire

class Receta {
    private var _nombre: String!
    private var _recetaID: String!
    
    var nombre: String { return _nombre }
    var recetaID: String { return _recetaID }

    
    init(nombre: String, recetaID: String) {
        self._nombre = nombre.capitalized
        self._recetaID = recetaID
    }
}
