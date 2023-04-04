//
//  AddNewUser.swift
//  ProfilesApp
//
//  Created by Nazar Kydyraliev on 4/4/23.
//

import Foundation
import UIKit

class AddNewUser: UIViewController {
    
    private lazy var viewForEmail: UIView = {
        var viewEmail = UIView()
        viewEmail.backgroundColor = .black
        viewEmail.layer.cornerRadius = 10
        return viewEmail
    }()
    
    private lazy var fieldForEmail: UITextField = {
        var fieldEmail = UITextField()
        fieldEmail.attributedPlaceholder = NSAttributedString(
            string: "Email*", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        fieldEmail.textColor = .white
        return fieldEmail
    }()
    
    private lazy var viewForFirstName: UIView = {
        var viewFirstName = UIView()
        viewFirstName.backgroundColor = .black
        viewFirstName.layer.cornerRadius = 10
        return viewFirstName
    }()
    
    private lazy var fieldForFirstName: UITextField = {
        var fieldFirstName = UITextField()
        fieldFirstName.attributedPlaceholder = NSAttributedString(
            string: "First Name*", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        fieldFirstName.textColor = .white
        return fieldFirstName
    }()
    
    private lazy var viewForLastName: UIView = {
        var viewLastName = UIView()
        viewLastName.backgroundColor = .black
        viewLastName.layer.cornerRadius = 10
        return viewLastName
    }()
    
    private lazy var fieldForLastName: UITextField = {
        var fieldLastName = UITextField()
        fieldLastName.attributedPlaceholder = NSAttributedString(
            string: "Last Name *", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        fieldLastName.textColor = .white
        return fieldLastName
    }()
    
    private lazy var finishAddUser: UIButton = {
        var buttonFinish = UIButton()
        buttonFinish.setTitle("Finish Add", for: .normal)
        buttonFinish.backgroundColor = .gray
        buttonFinish.layer.cornerRadius = 10
        //buttonFinish.addTarget(self, action: #selector(postRequest(sender:)), for: .touchUpInside)
        return buttonFinish
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        title = "Add New User"
        addObjects()
        setupConstraints()
        targetFunc()
    }
    
    func addObjects(){
        view.addSubview(viewForEmail)
        view.addSubview(fieldForEmail)
        view.addSubview(viewForFirstName)
        view.addSubview(fieldForFirstName)
        view.addSubview(viewForLastName)
        view.addSubview(fieldForLastName)
        view.addSubview(finishAddUser)
    }
    
    func targetFunc() {
        fieldForEmail.addTarget(self, action: #selector(textFieldsEditingChanged), for: .editingChanged)
        fieldForFirstName.addTarget(self, action: #selector(textFieldsEditingChanged), for: .editingChanged)
        fieldForLastName.addTarget(self, action: #selector(textFieldsEditingChanged), for: .editingChanged)
    }
    
    func setupConstraints(){
        viewForFirstName.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(320)
            make.height.equalTo(70)
        }
        
        viewForEmail.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(viewForFirstName.snp.top).offset(-25)
            make.width.equalTo(320)
            make.height.equalTo(70)
        }
        
        viewForLastName.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(viewForFirstName.snp.bottom).offset(25)
            make.width.equalTo(320)
            make.height.equalTo(70)
        }
        
        fieldForEmail.snp.makeConstraints { make in
            make.edges.equalTo(viewForEmail.snp.edges).inset(10)
        }
        
        fieldForFirstName.snp.makeConstraints { make in
            make.edges.equalTo(viewForFirstName.snp.edges).inset(10)
        }
        
        fieldForLastName.snp.makeConstraints { make in
            make.edges.equalTo(viewForLastName.snp.edges).inset(10)
        }
        
        finishAddUser.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(viewForLastName.snp.bottom).offset(25)
            make.width.equalTo(320)
            make.height.equalTo(70)
        }
    
    }
    
    @objc func textFieldsEditingChanged() {
        if let textEmail = fieldForEmail.text, !textEmail.isEmpty,
           let textFirstName = fieldForFirstName.text, !textFirstName.isEmpty,
           let textLastName = fieldForLastName.text, !textLastName.isEmpty {
            
            finishAddUser.isEnabled = true
            finishAddUser.backgroundColor = .blue
        } else {
            finishAddUser.isEnabled = false
            finishAddUser.backgroundColor = .gray
        }
    }
}

