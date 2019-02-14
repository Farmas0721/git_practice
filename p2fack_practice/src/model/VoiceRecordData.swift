//
//  VoiceRecordData.swift
//  p2fack_practice
//
//  Created by 中村　朝陽 on 2019/02/14.
//  Copyright © 2019年 Fuuya Yamada. All rights reserved.
//

import UIKit
import AVFoundation

class VoiceRecordData: NSObject {
    let path:NSData
    let kPath = "PATH"
    
    var audioPlayer: AVAudioPlayer!
    
    init(path: NSData) {
        self.path = path
    }
    
    init(dictionaly:[String:Any] ) {
        path = dictionaly[kPath] as! NSData
    }
    
}
