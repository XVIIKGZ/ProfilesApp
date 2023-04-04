//
//  ViewController.swift
//  NewsAppM4
//
//  Created by Nazar Kydyraliev on 27/3/23.
//

import UIKit
import SnapKit
import Foundation
import Kingfisher

class ViewController: UIViewController {

    private var tableView = UITableView()
    private var timeData: [Datum] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        apiManager()
    }

    private func initUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        title = "List Users"
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        tableView.register(ProfileViewCell.self, forCellReuseIdentifier: ProfileViewCell.idCell)
        
        tableView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
            make.top.equalTo(view.snp.top).offset(80)
        }
    }
    
    func apiManager(){
        APIManager.shared.getData { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    guard let `self` else {return}
                    self.timeData = data.data
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        timeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileViewCell.idCell) as! ProfileViewCell
        
        let value = timeData[indexPath.row]
        
        cell.configure(with: value)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let profileDetail = ProfileDetail()
        let value = timeData[indexPath.row]
        profileDetail.configure(with: value)
        self.navigationController?.pushViewController(profileDetail, animated: true)
    }
    
}

