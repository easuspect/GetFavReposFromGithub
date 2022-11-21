//
//  ReposViewController.swift
//  GetFavReposFromGithub
//
//  Created by NewMac on 11/20/22.
//

import UIKit

class ReposViewController: UIViewController {

   private let api: NetworkManager
    
    init(api: NetworkManager) {
        self.api = api
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        view.backgroundColor = .red
        api.request(urlString: "https://api.github.com/search/repositories?q=language=+sort:stars",
                    method: .get,
                    success: { [weak self] (response: GetReposResponse) in
            print(response.items)
        },
                    failure: { [weak self] error in
            print(error)
        })
    }
}


