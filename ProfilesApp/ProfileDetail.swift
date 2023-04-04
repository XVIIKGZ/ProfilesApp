//
//  DetailsNews.swift
//  NewsAppM4
//
//  Created by Nazar Kydyraliev on 28/3/23.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

class ProfileDetail: UIViewController {
    
    func configure(with: Datum) {
        self.titleLabel.text! += with.email
        self.textLabel.text! += with.firstName
        self.authorText.text! += with.lastName
        handleImage(url: with.avatar!)
    }
    
    private func handleImage(url: String) {
        let url = URL(string: url)
        self.imgNews.kf.setImage(with: url)
    }

    let titleLabel: UILabel = {
        let titleL = UILabel()
        titleL.numberOfLines = 0
        titleL.text = "Email: "
        titleL.font = .boldSystemFont(ofSize: 16)
        return titleL
    }()
    
    let textLabel: UILabel = {
        let textL = UILabel()
        textL.numberOfLines = 0
        textL.text = "First Name: "
        textL.font = .systemFont(ofSize: 13)
        return textL
    }()
    
    let authorText: UILabel = {
        let author = UILabel()
        author.numberOfLines = 0
        author.text = "Last Name: "
        author.font = .systemFont(ofSize: 13)
        return author
    }()
    
    let imgNews: UIImageView = {
        let imgN = UIImageView()
        imgN.layer.masksToBounds = true
        imgN.clipsToBounds = true
        return imgN
    }()
    
    private lazy var addProfileButton: UIButton = {
        var button = UIButton()
        button.setTitle("Add new profile", for: .normal)
        button.backgroundColor = .black
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAllObject()
        settingsContraint()
        view.backgroundColor = .white
        title = "Detailed Profile"
    }
    
    func addAllObject(){
        view.addSubview(titleLabel)
        view.addSubview(textLabel)
        view.addSubview(imgNews)
        view.addSubview(authorText)
        view.addSubview(addProfileButton)
        addProfileButton.addTarget(self, action: #selector(buttonAdd), for: .touchUpInside)
    }
    
    func settingsContraint(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(120)
            make.left.right.equalToSuperview().inset(16)
        }
        
        titleLabel.font = .boldSystemFont(ofSize: 20)
        
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(25)
        }
        
        imgNews.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(textLabel.snp.bottom).offset(30)
            make.height.equalTo(200)
            make.left.right.equalToSuperview().inset(16)
        }
        
        imgNews.layer.cornerRadius = 20
        
        authorText.snp.makeConstraints { make in
            make.top.equalTo(imgNews.snp.bottom).offset(30)
            make.right.equalToSuperview().inset(16)
        }
        
        addProfileButton.snp.makeConstraints { make in
            make.top.equalTo(authorText.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(75)
            make.width.equalTo(250)
        }
        
        addProfileButton.layer.cornerRadius = 20
    }
    
    @objc func buttonAdd(sender: UIButton) {
        let addNewUser = AddNewUser()
        self.navigationController?.pushViewController(addNewUser, animated: true)
    }
}
