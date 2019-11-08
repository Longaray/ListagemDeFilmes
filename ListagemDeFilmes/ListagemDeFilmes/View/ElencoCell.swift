//
//  ElencoCell.swift
//  ListagemDeFilmes
//
//  Created by Rodrigo on 08/11/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import UIKit
import AlamofireImage

class ElencoCell: UICollectionViewCell {
   
    @IBOutlet weak var imgCast:UIImageView!
    @IBOutlet weak var lblName:UILabel!
    @IBOutlet weak var lblCharacter:UILabel!
    
    var personViewModel: PersonViewModel!
    {
        didSet
        {
            self.lblName.text = personViewModel.name
            self.lblCharacter.text = personViewModel.character
            if let imageURL = URL(string: personViewModel.urlProfile), let placeholder = UIImage(named: "notAvailable") {
                 imgCast.af_setImage(withURL: imageURL, placeholderImage: placeholder)
            }            
        }
        
    }
    
}
