//
//  WKVideoPlugin.m
//  WallpaperKit
//
//  Created by Naville Zhang on 2017/1/9.
//  Copyright © 2017年 NavilleZhang. All rights reserved.
//

#import "WKVideoPlugin.h"
@implementation WKVideoPlugin{
    AVPlayer* player;
}
- (instancetype)initWithWindow:(NSWindow*)window andArguments:(NSDictionary*)args{
    NSRect frameRect=window.frame;
    self=[super initWithFrame:frameRect];
    player=[AVPlayer playerWithURL:[args objectForKey:@"Path"]];
    player.actionAtItemEnd=AVPlayerActionAtItemEndNone;
    self.player=player;
    self.showsSharingServiceButton=NO;
    self.showsFrameSteppingButtons=NO;
    self.showsFullScreenToggleButton=NO;
    self.controlsStyle=AVPlayerViewControlsStyleNone;
    [player play];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(observer:)
                                                 name:AVPlayerItemDidPlayToEndTimeNotification
                                               object:[player currentItem]];
    return self;
}
-(void)observer:(NSNotification *)notif{
    if([notif.name isEqualToString:AVPlayerItemDidPlayToEndTimeNotification]){
        AVPlayerItem *p = [notif object];
        [p seekToTime:kCMTimeZero];
    }
    
}
-(void)pause{
    [player pause];
}
-(void)play{
    [player play];
}
-(void)handleSpaceChange{
    
}
@end