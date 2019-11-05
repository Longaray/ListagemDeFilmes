//
//  Filme.swift
//  ListagemDeFilmes
//
//  Created by Rodrigo on 05/11/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import Foundation
import ObjectMapper

struct Filme: Mappable
{
    var id: Int?
    var nome: String?
    var descricao: String?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id          <- map["id"]
        nome        <- map["nome"]
        descricao   <- map["descricao"]
    }
}


