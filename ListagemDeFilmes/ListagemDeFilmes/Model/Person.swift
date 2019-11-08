//
//  Person.swift
//  ListagemDeFilmes
//
//  Created by Rodrigo on 08/11/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import Foundation
import ObjectMapper

struct Person: Mappable
{
    var cast_id = 0
    var character: String?
    var credit_id: String?
    var gender = 0
    var name: String?
    var profile_path: String?

    init?(map: Map)
    {
    }
    
    mutating func mapping(map: Map)
    {
        cast_id         <- map["cast_id"]
        character       <- map["character"]
        credit_id       <- map["credit_id"]
        gender          <- map["gender"]
        name            <- map["name"]
        profile_path    <- map["profile_path"]
    }
}



