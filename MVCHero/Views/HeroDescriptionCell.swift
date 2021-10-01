//
//  HeroDescriptionCell.swift
//  MVCHero
//
//  Created by Fernado Belen on 30/09/2021.
//

import UIKit

class HeroDescriptionCell: UITableViewCell {
    
    var hero: HeroStats! {
        didSet{
            lblAttribute.text = hero.primary_attr
            lblAttack.text = hero.attack_type
            lblLegs.text = "\(hero.legs)"
        }
    }
    
    private lazy var lblAttribute: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblAttack: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblLegs: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //Etiquetas
    private lazy var lblAttributeTitle: UILabel = {
        let label = UILabel()
        label.text = String.lblAttribute
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblAttackTitle: UILabel = {
        let label = UILabel()
        label.text = String.lblAttack
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblLegsTitle: UILabel = {
        let label = UILabel()
        label.text = String.lblLegs
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
        addSubview(lblAttribute)
        addSubview(lblAttack)
        addSubview(lblLegs)
        addSubview(lblAttributeTitle)
        addSubview(lblAttackTitle)
        addSubview(lblLegsTitle)
    }
    
    func addConstraints(){
        NSLayoutConstraint.activate([lblAttribute.topAnchor.constraint(equalTo: topAnchor, constant: 30),
                                     lblAttribute.leadingAnchor.constraint(equalTo: lblAttributeTitle.trailingAnchor, constant: 20),
                                     lblAttribute.heightAnchor.constraint(equalToConstant: 20),
                                     
                                     lblAttack.topAnchor.constraint(equalTo: lblAttribute.bottomAnchor, constant: 15),
                                     lblAttack.leadingAnchor.constraint(equalTo: lblAttackTitle.trailingAnchor, constant: 35),
                                     lblAttack.heightAnchor.constraint(equalToConstant: 20),
                                     
                                     lblLegs.topAnchor.constraint(equalTo: lblAttack.bottomAnchor, constant: 15),
                                     lblLegs.leadingAnchor.constraint(equalTo: lblLegsTitle.trailingAnchor, constant: 55),
                                     lblLegs.heightAnchor.constraint(equalToConstant: 20),
                                     
                                     //Etiquetas:
                                     lblAttributeTitle.topAnchor.constraint(equalTo: topAnchor, constant: 30),
                                     lblAttributeTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
                                     lblAttributeTitle.heightAnchor.constraint(equalToConstant: 20),
                                     
                                     lblAttackTitle.topAnchor.constraint(equalTo: lblAttributeTitle.bottomAnchor, constant: 15),
                                     lblAttackTitle.leadingAnchor.constraint(equalTo: lblAttributeTitle.leadingAnchor, constant: 0),
                                     lblAttackTitle.heightAnchor.constraint(equalToConstant: 20),
                                     
                                     lblLegsTitle.topAnchor.constraint(equalTo: lblAttackTitle.bottomAnchor, constant: 15),
                                     lblLegsTitle.leadingAnchor.constraint(equalTo: lblAttackTitle.leadingAnchor, constant: 0),
                                     lblLegsTitle.heightAnchor.constraint(equalToConstant: 20),
                                     lblLegsTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)])
    }
}

fileprivate extension String {
    static var lblAttribute = "Attribute: "
    static var lblAttack = "Attack: "
    static var lblLegs = "Leg: "
}
