//
//  BackdropViewModel.swift
//  ListagemDeFilmes
//
//  Created by Rodrigo on 07/11/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import Foundation
import UIKit

struct BackdropViewModel
{
    var aspectRatio:String
    let imageBackDropURL:String
    
    init(backdrop: Backdrop)
    {
        self.aspectRatio = String(format: "%.1f",  backdrop.aspect_ratio)
        let urlPath = "https://image.tmdb.org/t/p/w500"
        self.imageBackDropURL = (urlPath + backdrop.file_path!)
    }
}
