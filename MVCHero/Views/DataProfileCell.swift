//
//  DataProfileCell.swift
//  MVCHero
//
//  Created by Fernado Belen on 30/09/2021.
//

import UIKit

class DataProfileCell: UITableViewCell {
    
    var hero: HeroStats! {
        didSet{
            lblFullName.text = hero.localized_name
            let urlString = "https://api.opendota.com"+(hero?.img)!
            let url = URL(string: urlString)!
            imgPhoto.downloaded(from: url)
        }
    }
    
    private lazy var lblFullName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints =  false
        label.font = .boldSystemFont(ofSize: 40)
        return label
    }()
    
    private lazy var imgPhoto: UIImageView = {
        let imgPhoto = UIImageView()
        imgPhoto.layer.cornerRadius = imgWidth/2
        imgPhoto.layer.borderColor = UIColor.black.cgColor
        imgPhoto.layer.borderWidth = 3
        imgPhoto.layer.masksToBounds = true
        imgPhoto.translatesAutoresizingMaskIntoConstraints = false
        return imgPhoto
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
        addSubview(lblFullName)
        addSubview(imgPhoto)
    }
    
    func addConstraints(){
        NSLayoutConstraint.activate([lblFullName.topAnchor.constraint(equalTo: imgPhoto.bottomAnchor, constant: 15),
                                     lblFullName.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     lblFullName.heightAnchor.constraint(equalToConstant: 50),
                                     lblFullName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
                                     
                                     imgPhoto.topAnchor.constraint(equalTo: topAnchor),
                                     imgPhoto.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     imgPhoto.widthAnchor.constraint(equalToConstant: imgWidth),
                                     imgPhoto.heightAnchor.constraint(equalToConstant: imgHeigth)])
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
