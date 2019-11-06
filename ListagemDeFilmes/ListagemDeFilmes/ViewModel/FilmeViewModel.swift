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
    let image:UIImage
         
    init(filme: Filme)
    {
        self.titulo = filme.title ?? ""
        self.rating = String(format: "%.1f", filme.vote_average)
        //var stringAno = ""
        if let stringAno = filme.release_date
        {
            self.ano = String((stringAno.split(separator: "-"))[0])
        }
        else
        {
            self.ano = ""
        }
        self.overview = filme.overview ?? ""
        
        //TODO find path
        let urlPath = ""
        let urlString = (urlPath + filme.poster_path!)
        
        let url = URL(string: urlString)
        //let data = try? Data(contentsOf: url!)
        if let data =  try? Data(contentsOf: url!)
        {
            self.image = UIImage(data: data)!
        }
        else
        {
            self.image = UIImage(named: "notAvailable")!
        }
        //TODO: tratamentos
    }
}
