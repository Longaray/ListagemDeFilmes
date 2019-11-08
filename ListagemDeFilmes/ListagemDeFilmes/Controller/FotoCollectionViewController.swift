//
//  FotoCollectionViewController.swift
//  ListagemDeFilmes
//
//  Created by Rodrigo on 07/11/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import UIKit

protocol FotoCollectionViewControllerDelegate{
    func setFilmeID(filmeID: Int)
}

class FotoCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, FotoCollectionViewControllerDelegate
{
 
    //@IBOutlet weak var pgFotoCollection:UIPageControl!
    
    private var backdropViewModel = [BackdropViewModel]()
    private var filmeID = 0
    let service = Service()
    var maxFotos = 10
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.fetchImagens()
    }
    
    func setFilmeID(filmeID: Int)
    {
        self.filmeID = filmeID
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.backdropViewModel.count > maxFotos ? maxFotos : self.backdropViewModel.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FotoCollectionCell", for: indexPath) as! FotoCollectionCell
        if ( self.backdropViewModel.count > 0)
        {
            //cell.imgCollection.image = UIImage(named: "notAvailable")
            let backdropViewModel = self.backdropViewModel[indexPath.row]
            cell.backdropViewModel = backdropViewModel
            
            cell.pgFotoCollection.currentPage = indexPath.row
            cell.pgFotoCollection.numberOfPages = self.backdropViewModel.count > maxFotos ? maxFotos : self.backdropViewModel.count
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {

    }
    
    func fetchImagens()
    {
        self.service.getImagensFilme(movieID: "238", completionHandler: {imagens,error  in
            guard error == nil else {
                return
            }
            self.backdropViewModel = imagens?.map({return BackdropViewModel(backdrop: $0)}) ?? []
            //print(filmes)
            self.collectionView.reloadData()
        })
    }
    
    

}
