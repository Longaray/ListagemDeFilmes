//
//  Service.swift
//  ListagemDeFilmes
//
//  Created by Rodrigo on 05/11/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import ObjectMapper

class Service: NSObject {
    
    private let urlAPI = "https://api.themoviedb.org/3/"

    private let apiKey = "16fd5a2a34d2c3651edf338a920f6176"
    
    //func  header
    //Retrive Filmes
    func getFilmes(page:String, completionHandler: @escaping ([Filme]?,Error?) -> Void)
    {
        
        let parameters = [
            "api_key"   : apiKey,
            "language"  : "en-US",
            "page"      : page
        ]
        
        let urlFilmes = urlAPI + "movie/top_rated"
        
        Alamofire.request(urlFilmes, method: .get, parameters: parameters).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                let results = swiftyJsonVar["results"]
                let filmes = Mapper<Filme>().mapArray(JSONString: results.description)
                //print(swiftyJsonVar)
                completionHandler(filmes,nil)
            }
        }
    }
    
    func getTotalFilmes(completionHandler: @escaping (Int?,Error?) -> Void)
    {
        
        let parameters = [
            "api_key": apiKey,
            "language":"en-US"
        ]
        
        let urlFilmes = urlAPI + "movie/top_rated"
        
        Alamofire.request(urlFilmes, method: .get, parameters: parameters).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                let totalResults = swiftyJsonVar["total_results"]
                completionHandler(totalResults.intValue,nil)
            }
        }
    }
    
    func getImagensFilme(movieID:String, completionHandler: @escaping ([Backdrop]?,Error?) -> Void)
    {
        
        let parameters = [
            "api_key"   : apiKey
        ]
        
        let urlPosters = urlAPI + String(format:"movie/%@/images", movieID)
        
        Alamofire.request(urlPosters, method: .get, parameters: parameters).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                let results = swiftyJsonVar["backdrops"]
                let backdrops = Mapper<Backdrop>().mapArray(JSONString: results.description)
                //print(swiftyJsonVar)
                completionHandler(backdrops,nil)
            }
        }
    }
    
    func getDuracaoFilme(movieID:String, completionHandler: @escaping (String?,Error?) -> Void)
    {
        
        let parameters = [
            "api_key"   : apiKey
        ]
        
        let urlDetail = urlAPI + String(format:"movie/%@", movieID)
        
        Alamofire.request(urlDetail, method: .get, parameters: parameters).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                let runtime = swiftyJsonVar["runtime"]
                //print(swiftyJsonVar)
                completionHandler(runtime.stringValue,nil)
            }
        }
    }
    
    func getElencoFilme(movieID:String, completionHandler: @escaping ([Person]?,Error?) -> Void)
    {
        
        let parameters = [
            "api_key"   : apiKey
        ]
        
        let urlPosters = urlAPI + String(format:"movie/%@/credits", movieID)
        
        Alamofire.request(urlPosters, method: .get, parameters: parameters).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                let results = swiftyJsonVar["cast"]
                let cast = Mapper<Person>().mapArray(JSONString: results.description)
                //print(swiftyJsonVar)
                completionHandler(cast,nil)
            }
        }
    }
    
    
}
