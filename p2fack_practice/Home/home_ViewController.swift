//
//  home_ViewController.swift
//  p2fack_practice
//
//  Created by Fuuya Yamada on 2019/02/10.
//  Copyright © 2019 Fuuya Yamada. All rights reserved.
//

import UIKit

let TODO = ["牛乳を買う", "掃除をする", "アプリ開発の勉強をする"]
let TIME = ["2","3","4"]

class home_ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.register(UINib(nibName:"TableViewCell",bundle:nil), forCellReuseIdentifier:"TableViewCell")
        
        if UserDefaults.standard.object(forKey: "TaskList") != nil {
            taskList = UserDefaults.standard.object(forKey: "TaskList") as! [String]
        }
    }
    
    //数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TODO.count
    }
    
    //セルの内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        // セルに表示する値を設定する
        cell.taskTime!.text = TIME[indexPath.row]
        cell.taskName!.text = TODO[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 100
    }
    
}
