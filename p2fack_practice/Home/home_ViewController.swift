//
//  home_ViewController.swift
//  p2fack_practice
//
//  Created by Fuuya Yamada on 2019/02/10.
//  Copyright © 2019 Fuuya Yamada. All rights reserved.
//

import UIKit


var taskList = [String]()

class home_ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var taskTime = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.register(UINib(nibName:"TableViewCell",bundle:nil), forCellReuseIdentifier:"TableViewCell")
        
        if UserDefaults.standard.object(forKey: "TaskList") != nil {
            taskList = UserDefaults.standard.object(forKey: "TaskList") as! [String]
        }
    }
    
    
    //更新
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    //数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    //セルの内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        // セルに表示する値を設定する
        cell.taskTime!.text = getNowClockString()
        cell.taskName!.text = taskList[indexPath.row]
        return cell
    }
    
    
    func getNowClockString() -> String {
        //   let formatter = DateFormatter()
        let now = Date()
        let days = Calendar.current.dateComponents([.day], from: taskTime, to: now).day!
        // formatter.dateFormat = "dd日前"
        return String(days)
        
    }
    
    //cell高さ
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 100
    }
    
    //cell削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let index = indexPath.row
        taskList.remove(at: index)
        UserDefaults.standard.set(taskList, forKey: "TaskList" )
        tableView.reloadData()
    }
}
