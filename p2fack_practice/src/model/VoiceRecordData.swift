//
//  VoiceRecordData.swift
//  p2fack_practice
//
//  Created by 中村　朝陽 on 2019/02/14.
//  Copyright © 2019年 Fuuya Yamada. All rights reserved.
//

import UIKit
import AVFoundation

class RecordedVoice: NSObject {
    var path:String = ""
    var name:String = ""
    
    let kPath = "PATH"
    let kName = "NAME"
    
    var audioPlayer: AVAudioPlayer!
    
    init(path: String, name: String) {
        self.path = path
        self.name = name
    }
    
    init(dictionary:[String:Any] ) {
        path = dictionary[kPath] as! String
        name = dictionary[kName] as! String
    }
    
    func dictionaryFromVoice() -> [String:Any]{
        return [kPath : path]
    }
    
}
