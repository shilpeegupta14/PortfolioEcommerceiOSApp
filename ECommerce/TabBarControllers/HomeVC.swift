//
//  HomeVC.swift
//  ECommerce
//
//  Created by aditya sharma on 10/08/23.
//

import UIKit

class HomeVC: BaseVC {


    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }


}

extension HomeVC: UITableViewDelegate {

}

extension HomeVC: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CEnumClass.sharedEnum.cateArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        cell.titleLabel.text = CEnumClass.sharedEnum.cateArr[indexPath.row]
        cell.totalProductLabel.text = CEnumClass.sharedEnum.totalItemArr[indexPath.row]
        cell.iconImageVIew.image = UIImage(systemName: CEnumClass.sharedEnum.cateIconArr[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}
