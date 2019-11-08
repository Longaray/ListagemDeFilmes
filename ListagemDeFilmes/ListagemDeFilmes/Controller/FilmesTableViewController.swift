//
//  FilmesTableViewController.swift
//  ListagemDeFilmes
//
//  Created by Rodrigo on 06/11/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import Foundation
import UIKit

class FilmesTableViewController : UITableViewController, UITableViewDataSourcePrefetching
{
    @IBOutlet weak var tbtFilmes:UITableView!
    
    private var filmesViewModels = [FilmeViewModel]()
    let service = Service()
    private var page = 1
    private var totalFilmes = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if #available(iOS 10.0, *) {
            self.tbtFilmes.prefetchDataSource = self
        } else {
            // Fallback on earlier versions
        }
        
        self.page = 1
        self.fetchTotalFilmesData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //Total Filmes server
        return self.totalFilmes
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmeCell") as! FilmeCell
        if(indexPath.row < self.filmesViewModels.count)
        {
            let filmesViewModel = self.filmesViewModels[indexPath.row]
            cell.filmeViewModel = filmesViewModel
            
            let backgroundView = UIView()
            backgroundView.backgroundColor = UIColor.darkGray
            cell.selectedBackgroundView = backgroundView
            cell.imgPoster.layer.borderColor = UIColor.green.cgColor
        }
       return cell
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath])
    {
        if indexPaths.contains(where: isLoadingCell) {
            //Populate list with all characters
            self.fetchFilmesData()
            self.page+=1
        }
    }
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "DetalheFilmeViewController") as! DetalheFilmeViewController
        controller.setFilme(filme: self.filmesViewModels[indexPath.row])

        self.navigationController!.pushViewController( controller, animated: true )
        //self.present(controller, animated: true, completion: nil)
        
    }
    
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return (indexPath.row >= self.filmesViewModels.count)
    }
    
    func fetchFilmesData()
    {
        self.service.getFilmes(page: String(self.page), completionHandler: {filmes,error  in
            guard error == nil else {
                return
            }
            self.filmesViewModels += filmes?.map({return FilmeViewModel(filme: $0)}) ?? []
            //print(filmes)
            self.tbtFilmes.reloadData()
        })
    }
    
    func fetchTotalFilmesData()
    {
        //Get total of charaters
        self.service.getTotalFilmes(completionHandler: {total,error  in
        guard error == nil else {
            return
        }
            self.totalFilmes = total ?? 0
            self.tbtFilmes.reloadData()
        })
    }
}
 
