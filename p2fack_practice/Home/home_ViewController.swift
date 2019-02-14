//
//  home_ViewController.swift
//  p2fack_practice
//
//  Created by Fuuya Yamada on 2019/02/10.
//  Copyright © 2019 Fuuya Yamada. All rights reserved.
//

import UIKit

let TODO = ["牛乳を買う", "掃除をする", "アプリ開発の勉強をする"]


class home_ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return TODO.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // セルに表示する値を設定する
        cell.textLabel!.text = TODO[indexPath.row]
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }


}
