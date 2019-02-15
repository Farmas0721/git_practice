//
//  AVAudioSessionPatch.h
//  p2fack_practice
//
//  Created by 中村　朝陽 on 2019/02/16.
//  Copyright © 2019年 Fuuya Yamada. All rights reserved.
//


@import AVFoundation;

NS_ASSUME_NONNULL_BEGIN

@interface AVAudioSessionPatch : NSObject

+ (BOOL)setSession:(AVAudioSession *)session category:(AVAudioSessionCategory)category withOptions:(AVAudioSessionCategoryOptions)options error:(__autoreleasing NSError **)outError;

@end

NS_ASSUME_NONNULL_END
