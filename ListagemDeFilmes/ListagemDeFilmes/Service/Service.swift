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
    
    private let urlFilmes = "https://api.themoviedb.org/3/movie/top_rated"

    private let apiKey = "16fd5a2a34d2c3651edf338a920f6176"
    
    //func  header
    //Retrive Filmes
    func getFilmes(/*offset:String ,*/ completionHandler: @escaping ([Filme]?,Error?) -> Void)
    {
        
        let parameters = [
            "api_key": apiKey,
            "language":"en-US"
        ]
        
        Alamofire.request(urlFilmes, method: .get, parameters: parameters).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                let results = swiftyJsonVar["results"]
                let filmes = Mapper<Filme>().mapArray(JSONString: results.description)
                //print(swiftyJsonVar)
                completionHandler(filmes,nil)
            }
            else{
                //TODO: alert
                let alerta = "Tente Novamente"
            }
        }
    }
    
}
