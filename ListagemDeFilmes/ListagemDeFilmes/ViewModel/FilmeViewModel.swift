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
    let nome:String
         
    init(filme: Filme)
    {
        self.nome = filme.nome ?? ""
        //TODO: tratamentos
    }
}
