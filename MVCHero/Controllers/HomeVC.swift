//
//  HomeVC.swift
//  MVCHero
//
//  Created by Fernado Belen on 29/09/2021.
//

import UIKit

class HomeVC: UIViewController {
    
    var hero = [HeroStats]()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.separatorColor = .black
        self.title = "Heros"
        downloadJson {
            self.tableView.reloadData()
        }
    }
    
    func downloadJson(completed : @escaping () -> ()){
        let url = URL(string: "https://api.opendota.com/api/heroStats")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do{
                    self.hero = try JSONDecoder().decode([HeroStats].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                }catch{
                    print("Json Error")
                }
            }
        }.resume()
    }
    
    func setupView(){
        addViewHerarchy()
        addConstraints()
        addProperties()
    }
    
    func addViewHerarchy(){
        view.addSubview(tableView)
    }
    
    func addConstraints(){
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: view.topAnchor),
                                     tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
    }
    
    func addProperties(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DataHerosCell.self, forCellReuseIdentifier: "DataHerosCell")
    }
}

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataHerosCell", for: indexPath) as! DataHerosCell
        cell.hero = hero[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let heroDetailVC = HeroDetailVC(with: hero[indexPath.row])
        navigationController?.pushViewController(heroDetailVC, animated: true)
    }
    
}

extension HomeVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hero.count
    }
}
