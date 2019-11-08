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
    var poster_path: String?
    var title: String?
    var overview: String?
    var vote_average = 0.0
    var popularity = 0.0
    var backdrop_path: String?
    var original_language: String?
    var id = 0.0
    var adult = false
    var video = false
    var genre_ids = [Int]()
    var vote_count = 0
    var original_title : String?
    var release_date: String?
    
    init?(map: Map)
    {
    }
    
    mutating func mapping(map: Map)
    {
        
        poster_path         <- map["poster_path"]
        title               <- map["title"]
        overview            <- map["overview"]
        vote_average        <- map["vote_average"]
        popularity          <- map["popularity"]
        backdrop_path       <- map["backdrop_path"]
        original_language   <- map["original_language"]
        id                  <- map["id"]
        adult               <- map["adult"]
        video               <- map["video"]
        genre_ids           <- map["genre_ids"]
        vote_count          <- map["vote_count"]
        original_title      <- map["original_title"]
        release_date        <- map["release_date"]
    }
}


