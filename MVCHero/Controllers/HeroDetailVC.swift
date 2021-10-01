//
//  HeroDetailVC.swift
//  MVCHero
//
//  Created by Fernado Belen on 30/09/2021.
//

import UIKit

class HeroDetailVC: UIViewController {
    
    var hero: HeroStats
    
    lazy var tableViewDetail: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        addViewHerarchy()
        addConstraints()
        addProperties()
    }
    
    func addViewHerarchy(){
        view.addSubview(tableViewDetail)
    }
    
    func addConstraints(){
        NSLayoutConstraint.activate([tableViewDetail.topAnchor.constraint(equalTo: view.topAnchor),
                                     tableViewDetail.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     tableViewDetail.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     tableViewDetail.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
    }
    
    func addProperties(){
        tableViewDetail.delegate = self
        tableViewDetail.dataSource = self
        tableViewDetail.register(DataProfileCell.self, forCellReuseIdentifier: "DataProfileCell")
        tableViewDetail.register(HeroDescriptionCell.self, forCellReuseIdentifier: "HeroDescriptionCell")
    }
    
    init(with hero: HeroStats) {
        self.hero = hero
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HeroDetailVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DataProfileCell", for: indexPath) as! DataProfileCell
            cell.hero = self.hero
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeroDescriptionCell", for: indexPath) as!
            HeroDescriptionCell
            cell.hero = self.hero
            return cell
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension HeroDetailVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}

