//
//  YZCover.m
//  PullDownMenu
//
//  Created by yz on 16/8/12.
//  Copyright © 2016年 yz. All rights reserved.
//

#import "YZCover.h"

@implementation YZCover

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (_clickCover) {
        _clickCover();
    }
}

@end
