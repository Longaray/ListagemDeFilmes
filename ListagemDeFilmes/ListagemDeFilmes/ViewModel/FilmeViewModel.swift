//
//  FilmeViewModel.swift
//  ListagemDeFilmes
//
//  Created by Rodrigo on 05/11/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import Foundation
import UIKit

struct FilmeViewModel
{
    let titulo:String
    let rating:String
    let ano:String
    let overview:String
    let imagePosterURL:String
    let imageBackDropURL:String
    
    init(filme: Filme)
    {
        self.titulo = filme.title ?? ""
        self.rating = String(format: "%.1f", filme.vote_average)
        if let stringAno = filme.release_date
        {
            self.ano = String((stringAno.split(separator: "-"))[0])
        }
        else
        {
            self.ano = ""
        }
        self.overview = filme.overview ?? ""
        
        let urlPath = "https://image.tmdb.org/t/p/w500"
        self.imagePosterURL = (urlPath + filme.poster_path!)
        self.imageBackDropURL = (urlPath + filme.backdrop_path!)
    }
}
