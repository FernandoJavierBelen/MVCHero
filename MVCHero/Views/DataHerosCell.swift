//
//  DataHerosCell.swift
//  MVCHero
//
//  Created by Fernado Belen on 29/09/2021.
//

import UIKit

class DataHerosCell: UITableViewCell {
    
    var hero: HeroStats! {
        didSet {
            lblname.text = hero.localized_name
        }
    }
    
    private lazy var lblname: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblHeroName: UILabel = {
        let label = UILabel()
        label.text = String.lblHeroName
        label.textColor = .gray
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addViewHerarchy()
        addConstraints()
    }
    
    func addViewHerarchy(){
        addSubview(lblname)
        addSubview(lblHeroName)
    }
    
    func addConstraints(){
        NSLayoutConstraint.activate([lblname.topAnchor.constraint(equalTo: topAnchor,constant: 20),
                                     lblname.leadingAnchor.constraint(equalTo: lblHeroName.trailingAnchor,constant: 25),
                                     lblname.heightAnchor.constraint(equalToConstant: 20),
                                     
                                     lblHeroName.topAnchor.constraint(equalTo: topAnchor, constant: 20),
                                     lblHeroName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
                                     lblHeroName.heightAnchor.constraint(equalToConstant: 20)])
    }
}

fileprivate extension String {
    static var lblHeroName = "Hero name: "
}
