//
//  FilmeCell.swift
//  ListagemDeFilmes
//
//  Created by Rodrigo on 05/11/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import UIKit

class FilmeCell: UITableViewCell {
   
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblRating:UILabel!
    @IBOutlet weak var lblOverview:UILabel!
    @IBOutlet weak var lblYear:UILabel!
    @IBOutlet weak var imgPoster:UIImageView!
    
    var filmeViewModel: FilmeViewModel!
    {
        didSet
        {
            lblTitle?.text = filmeViewModel.titulo
            lblRating?.text = filmeViewModel.rating
            lblOverview?.text = filmeViewModel.overview
            lblYear?.text = filmeViewModel.ano
            imgPoster?.image = filmeViewModel.image
            
        }
        
    }
    
}
