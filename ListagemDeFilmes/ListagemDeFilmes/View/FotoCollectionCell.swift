//
//  FotoCollectionCell.swift
//  ListagemDeFilmes
//
//  Created by Rodrigo on 07/11/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//
import UIKit
import AlamofireImage

class FotoCollectionCell: UICollectionViewCell {
   
    @IBOutlet weak var imgCollection:UIImageView!
    @IBOutlet weak var pgFotoCollection:UIPageControl!
    
    var backdropViewModel: BackdropViewModel!
    {
        didSet
        {
            if let imageURL = URL(string: backdropViewModel.imageBackDropURL), let placeholder = UIImage(named: "notAvailable") {
                 imgCollection.af_setImage(withURL: imageURL, placeholderImage: placeholder)
            }
            
        }
        
    }
    
}
