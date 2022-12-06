//
//  ReposViewController.swift
//  GetFavReposFromGithub
//
//  Created by NewMac on 11/20/22.
//

import UIKit

class ReposViewController: UIViewController {
    
    private var repoList: [GithubRepo] = []
    
    private lazy var tableView: UITableView = {
        let table = UITableView.init(frame: .zero, style: .plain)
        table.dataSource = self
        table.register(ReposCell.self, forCellReuseIdentifier: "ReposCell")
        return table
    }()

   private let api: NetworkManager
    
    init(api: NetworkManager) {
        self.api = api
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        setupLayout()
        view.backgroundColor = .white
    
        api.request(urlString: "https://api.github.com/search/repositories?q=language=+sort:stars",
                    method: .get,
                    success: { [weak self] (response: GetReposResponse) in
            self?.repoList = response.items
            self?.tableView.reloadData()
        },
                    failure: { [weak self] error in
            print(error)
        })
    }
}

extension ReposViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repoList.count
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReposCell", for: indexPath) as? ReposCell else {
            fatalError("error")
        }
        cell.configure(with: repoList[indexPath.row])
        return cell
    }
}

private extension ReposViewController {
    func setupLayout() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
}
