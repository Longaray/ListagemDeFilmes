//
//  FilmeCell.swift
//  ListagemDeFilmes
//
//  Created by Rodrigo on 05/11/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import UIKit

class CharacterViewTableCell: UITableViewCell {
   
    var filmeViewModel: FilmeViewModel!
    {
        didSet
        {
            textLabel?.text = filmeViewModel.nome
            
        }
        
    }
    
}
