//
//  PullDownMenu.h
//  PullDownMenu
//
//  Created by yz on 16/8/12.
//  Copyright © 2016年 yz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YZPullDownItem,YZPullDownMenu;

/**
 *  下拉菜单数据源协议
 */
@protocol YZPullDownMenuDataSource <NSObject>

/**
 *  下拉菜单有多少列
 *
 *  @param pullDownMenu 下拉菜单
 *
 *  @return 下拉菜单有多少列
 */
- (NSInteger)numberOfColsInMenu:(YZPullDownMenu *)pullDownMenu;

/**
 *  下拉菜单每列按钮外观
 *
 *  @param pullDownMenu 下拉菜单
 *  @param index        第几列
 *
 *  @return 下拉菜单每列按钮外观
 */
- (UIButton *)pullDownMenu:(YZPullDownMenu *)pullDownMenu buttonForColAtIndex:(NSInteger)index;

/**
 *  下拉菜单每列对应的控制器
 *
 *  @param pullDownMenu 下拉菜单
 *  @param index        第几列
 *
 *  @return 下拉菜单每列对应的控制器
 */
- (UIViewController *)pullDownMenu:(YZPullDownMenu *)pullDownMenu viewControllerForColAtIndex:(NSInteger)index;

/**
 *  下拉菜单每列对应的高度
 *
 *  @param pullDownMenu 下拉菜单
 *  @param index        第几列
 *
 *  @return 下拉菜单每列对应的高度
 */
- (CGFloat)pullDownMenu:(YZPullDownMenu *)pullDownMenu heightForColAtIndex:(NSInteger)index;

@end


/**
 *  更新菜单标题，就发送这个通知（YZUpdateMenuTitleNote）
    为了降低耦合，才采取这种方式，而且方便通知主要界面，刷新数据、
 
    *** 【更新菜单标题步骤】 *** 
    1.把 【extern NSString * const YZUpdateMenuTitleNote;】 拷贝到自己控制器中
 
    2.在选中标题的方法中，发送以下通知
    [[NSNotificationCenter defaultCenter] postNotificationName:YZUpdateMenuTitleNote object:self userInfo:@{@"title":cell.textLabel.text}];
 
    3.1 postNotificationName：通知名称 =>【YZUpdateMenuTitleNote】
 
    3.2 object:谁发送的通知 =>【self】(当前控制器)
 
    3.3 userInfo:选中标题信息 => 可以多个key,多个value,没有固定的，因为有些界面，需要勾选很多选项，key可以随意定义。
 
    3.4 底层会自动判定，当前userInfo有多少个value,如果有一个就会直接更新菜单标题，有多个就会更新，满足大部分需求。
 
    3.5 发出通知，会自动弹回下拉菜单
 
 */
extern NSString * const YZUpdateMenuTitleNote;

@interface YZPullDownMenu : UIView
/**
 *  下拉菜单数据源
 */
@property (nonatomic, weak) id<YZPullDownMenuDataSource> dataSource;
/**
 *  分割线颜色
 */
@property (nonatomic, strong) UIColor *separateLineColor;
/**
 *  分割线距离顶部间距，默认10
 */
@property (nonatomic, assign) NSInteger separateLineTopMargin;
/**
 *  蒙版颜色
 */
@property (nonatomic, strong) UIColor *coverColor;

/**
 *  刷新下拉菜单
 */
- (void)reload;
@end
