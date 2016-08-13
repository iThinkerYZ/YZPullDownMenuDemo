//
//  YZCover.h
//  PullDownMenu
//
//  Created by yz on 16/8/12.
//  Copyright © 2016年 yz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YZCover : UIView
/**
 *  点击蒙版调用
 */
@property (nonatomic, strong) void(^clickCover)();

@end
