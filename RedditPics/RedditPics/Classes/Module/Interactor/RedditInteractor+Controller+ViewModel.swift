//
//  RedditInteractor+Controller+ViewModel.swift
//  RedditPics
//
//  Created by Banerjee,Subhodip on 27/05/19.
//  Copyright © 2019 Banerjee,Subhodip. All rights reserved.
//

import Foundation

class RedditInteractor: RedditBaseInteractor{
    
    private var redditPicsEntity: RedditPicsEntity
    weak var viewModelInputHolder: RedditPicsVCInput!
    
    override init(webService: NetworkingWebService) {
        redditPicsEntity = RedditPicsEntity(state: .done, posts: [])
        super.init(webService: webService)
    }
    
    private func makeNetworkRequest(with urlString: String) {
        webService.makeNetworkCall(with: urlString, convertInto: Listing.self) { [weak self](data) in
            guard let selfObject = self else { return }
            guard let dataListing = data as? Listing else { return }
            selfObject.redditPicsEntity.posts += dataListing.data.children.map{ $0.data }
            selfObject.updateViewModel()
        }
    }
    
    private func updateViewModel() {
        viewModelInputHolder.redditViewModel = RedditPicsViewModel(data: redditPicsEntity.posts)
        redditPicsEntity.state = .done
    }
    
    private func constructUrl() -> String {
        guard let lastPostName = redditPicsEntity.posts.last?.name else { return "" }
        return API.baseUrl + EndPoints.RedditPicsEndPoint.fetch.path + EndPoints.RedditPicsNextPagePoint.fetch.path + lastPostName
    }
}

extension RedditInteractor: RedditPicsVCOutput{
    
    func loadNewPage(_ firstTimeLoading: Bool) {
        if redditPicsEntity.state != RedditPicsEntityState.loading {
            redditPicsEntity.state = .loading
            let urlString = firstTimeLoading ? API.baseUrl + EndPoints.RedditPicsEndPoint.fetch.path : constructUrl()
            makeNetworkRequest(with: urlString)
        }
    }

}
