//
//  FilmesTableViewController.swift
//  ListagemDeFilmes
//
//  Created by Rodrigo on 06/11/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import Foundation
import UIKit

class FilmesTableViewController : UITableViewController
{
    @IBOutlet weak var tbtFilmes:UITableView!
    
    private var filmesViewModels = [FilmeViewModel]()
    let service = Service()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.fetchData()
    }
    
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Total characters server
        return self.filmesViewModels.count
   }
   
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
   {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmeCell") as! FilmeCell
        let filmesViewModel = self.filmesViewModels[indexPath.row]
        cell.filmeViewModel = filmesViewModel
       
       return cell
   }
    
    func fetchData()
    {
        self.service.getFilmes(/*offset: String(self.offSet),*/ completionHandler: {filmes,error  in
            guard error == nil else {
                return
            }
            self.filmesViewModels = filmes?.map({return FilmeViewModel(filme: $0)}) ?? []
            //print(filmes)
            self.tbtFilmes.reloadData()
        })
    }
}
 
