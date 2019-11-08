//
//  PersonViewModel.swift
//  ListagemDeFilmes
//
//  Created by Rodrigo on 08/11/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

struct PersonViewModel
{
    var castID = 0
    var character:String
    var name:String
    var urlProfile:String
    
    
    
    init(person: Person)
    {
        self.castID = person.cast_id
        self.name = person.name ?? ""
        self.character = person.character ?? ""
        let urlPath = "https://image.tmdb.org/t/p/w500"
        self.urlProfile = ""
        if let profilePath = person.profile_path
        {
            self.urlProfile = (urlPath + profilePath)
        }
    }
}
