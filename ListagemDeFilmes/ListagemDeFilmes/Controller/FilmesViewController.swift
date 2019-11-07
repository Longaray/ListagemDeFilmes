//
//  FilmesViewController.swift
//  ListagemDeFilmes
//
//  Created by Rodrigo on 05/11/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import UIKit

class FilmesViewController : UIViewController, UITableViewDelegate
{
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if (segue.identifier == "FilmesTableSegue")
        {
            //load the controller and test the trainer name before fliping screens
            let viewController = segue.destination as! FilmesTableViewController
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

