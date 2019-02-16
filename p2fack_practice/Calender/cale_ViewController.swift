//
//  cale_ViewController.swift
//  p2fack_practice
//
//  Created by Fuuya Yamada on 2019/02/10.
//  Copyright © 2019 Fuuya Yamada. All rights reserved.
//

import UIKit

class cale_ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var jigetsuButton: UIButton!
    @IBOutlet weak var zengetsuButton: UIButton!
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    
    let now = Date()
    var cal = Calendar.current
    let dateFormatter = DateFormatter()
    var components = DateComponents()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cal.locale = Locale(identifier: "ja")
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateFormat = "yyyy年M月"
        components.year = cal.component(.year, from: now)
        components.month = cal.component(.month, from: now)
        components.day = 1
        calculation()
    }
    
    func calculation(){
        let firstDayOfMonth = cal.date(from: components)
        dateLabel.text = dateFormatter.string(from: firstDayOfMonth!)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 37
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let firstDayOfMonth = cal.date(from: components)
        let firstWeekday = cal.component(.weekday, from: firstDayOfMonth!)
        //weekdayAdding: 1日が何曜日かで変わるindexPath.rowに加える値
        let weekdayAdding = 2 - firstWeekday
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        let daysCountInMonth = cal.range(of: .day, in: .month, for: firstDayOfMonth!)?.count
        //1日〜月末まで表示し、余ったCellは空白にする
        if (indexPath.row + weekdayAdding) >= 1 && (indexPath.row + weekdayAdding) <= daysCountInMonth! {
            cell.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
            let label = UILabel()
            label.font = UIFont(name: "Arial", size: 17)
            label.text = "\(indexPath.row + weekdayAdding)"
            label.sizeToFit()
            label.center = cell.contentView.center
            cell.contentView.addSubview(label)
        }
        else{
            cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let myBoundSize: CGFloat = UIScreen.main.bounds.size.width
        let cellSize : CGFloat = myBoundSize / 7.5
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    @IBAction func myActionZengetsu(_ sender: Any) {
        components.month = components.month! - 1
        calculation()
        myCollectionView.reloadData()
    }
    
    @IBAction func myActionJigetsu(_ sender: Any) {
        components.month = components.month! + 1
        calculation()
        myCollectionView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
