//
//  AudioStreamerViewController.m
//  IOS_bin
//
//  Created by binbin on 2018/12/16.
//  Copyright © 2018年 binbin. All rights reserved.
//

#import "AudioStreamerViewController.h"
#import <DOUAudioFile.h>

@interface AudioStreamerViewController ()<DOUAudioFile>

@end

@implementation AudioStreamerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViewBarItem:@"音频播放" leftTitle:@"🔙"rightTitle:@""];
}
- (NSURL *)audioFileURL{
    return [NSURL URLWithString:@""];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
