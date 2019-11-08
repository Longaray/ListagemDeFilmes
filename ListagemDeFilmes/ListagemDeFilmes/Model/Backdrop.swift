//
//  Backdrop.swift
//  ListagemDeFilmes
//
//  Created by Rodrigo on 07/11/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import Foundation
import ObjectMapper

struct Backdrop: Mappable
{
    var aspect_ratio = 0.0
    var file_path: String?
        
    init?(map: Map)
    {
    }
    
    mutating func mapping(map: Map)
    {
        aspect_ratio    <- map["aspect_ratio"]
        file_path       <- map["file_path"]
    }
}


