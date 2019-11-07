//
//  DetalheFilmeViewController.swift
//  ListagemDeFilmes
//
//  Created by Rodrigo on 07/11/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import Foundation
import UIKit

protocol UITableViewControllerDelegate{
    func setFilme(filme: FilmeViewModel)
}

class DetalheFilmeViewController : UIViewController, UITableViewControllerDelegate, UITableViewDelegate{
 
    @IBOutlet weak var imgBackground: UIImageView!
    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var lblDuracao: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var txtOverview: UITextView!
    
    var delegate:UITableViewControllerDelegate?
    var filmeViewModel: FilmeViewModel!

    func exitScreen() {

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //[self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        //self.navigationController.navigationBar.shadowImage = [UIImage new];
        
        lblTitulo?.text = self.filmeViewModel.titulo
        lblDuracao?.text = "Duracāo 2H30Min"
        lblRating?.text = self.filmeViewModel.rating
        txtOverview?.text = self.filmeViewModel.overview
        if let imageURL = URL(string: filmeViewModel.imagePosterURL), let placeholder = UIImage(named: "notAvailable") {
             imgPoster.af_setImage(withURL: imageURL, placeholderImage: placeholder)
        }
        if let imageURL = URL(string: filmeViewModel.imageBackDropURL), let placeholder = UIImage(named: "notAvailable") {
             imgBackground.af_setImage(withURL: imageURL, placeholderImage: placeholder)
        }
        imgPoster.layer.borderColor = UIColor.green.cgColor
        //Container


    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        //super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setFilme( filme: FilmeViewModel)
    {
        self.filmeViewModel = filme
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
