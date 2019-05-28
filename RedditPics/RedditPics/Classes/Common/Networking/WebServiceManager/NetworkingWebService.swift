//
//  NetworkingWebService.swift
//  RedditPics
//
//  Created by Banerjee,Subhodip on 27/05/19.
//  Copyright © 2019 Banerjee,Subhodip. All rights reserved.
//

import Foundation

typealias JSONCompletionHandler = (Decodable?) -> ()

final class NetworkingWebService{
    
    func makeNetworkCall<T: Decodable>(with urlString: String, convertInto model: T.Type, completion: @escaping JSONCompletionHandler){
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: request) { [weak self] (data, response, error) in
            guard let selfObject = self else { return }
            guard error == nil else {
                print("error in Network call")
                return
            }
            guard let responseData = data else {
                print("error in Data parsing")
                return
            }
            completion(selfObject.injectIntoModel(responseData, model))
        }
        dataTask.resume()
    }
    
    private func injectIntoModel<T : Decodable>(_ data: Data, _ model: T.Type) -> T? {
        let decoder = JSONDecoder()
        do {
            let mappedModel: T = try decoder.decode(model, from: data)
            return mappedModel
        } catch let error {
            print(error)
            return nil
        }
    }
}
