//
//  DWTabBarViewController.m
//  retial
//
//  Created by wangqiqi on 2017/8/23.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import "DWTabBarViewController.h"
#import <tolo/Tolo.h>

@interface DWTabBarViewController ()

@end

@implementation DWTabBarViewController

- (instancetype)init {
    if (self = [super init]) {
        REGISTER();
    }
    return self;
}

- (void)dealloc {
    UNREGISTER();
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)setupUI {
    
}



@end
