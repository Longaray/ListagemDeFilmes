//
//  ElencoViewController.swift
//  ListagemDeFilmes
//
//  Created by Rodrigo on 08/11/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import UIKit

protocol ElencoViewControllerDelegate{
    func setFilmeID(filmeID: String)
}

class ElencoViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, ElencoViewControllerDelegate
{
 
    private var personViewModel = [PersonViewModel]()
    private var filmeID: String = ""
    let service = Service()
    var maxFotos = 10
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.fetchElenco()
    }
    
    func setFilmeID(filmeID: String)
    {
        self.filmeID = filmeID
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.personViewModel.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ElencoCell", for: indexPath) as! ElencoCell
        if ( self.personViewModel.count > 0)
        {
            let personViewModel = self.personViewModel[indexPath.row]
            cell.personViewModel = personViewModel
            
            cell.imgCast.layer.masksToBounds = false
            cell.imgCast.layer.cornerRadius = cell.imgCast.frame.size.width / 2
            cell.imgCast.clipsToBounds = true
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: view.frame.width/3, height: view.frame.height)
    }
    
    
    func fetchElenco()
    {
        self.service.getElencoFilme(movieID: self.filmeID, completionHandler: {imagens,error  in
            guard error == nil else {
                return
            }
            self.personViewModel = imagens?.map({return PersonViewModel(person: $0)}) ?? []
            //print(filmes)
            self.collectionView.reloadData()
        })
    }
}
