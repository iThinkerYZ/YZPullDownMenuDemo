//
//  ViewController.m
//  YZPullDownMenuDemo
//
//  Created by yz on 16/8/13.
//  Copyright © 2016年 yz. All rights reserved.
//

#import "ViewController.h"
#import "YZPullDownMenu.h"
#import "YZMenuButton.h"
#import "YZMoreMenuViewController.h"
#import "YZSortViewController.h"
#import "YZAllCourseViewController.h"

#define YZScreenW [UIScreen mainScreen].bounds.size.width
#define YZScreenH [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<YZPullDownMenuDataSource>
@property (nonatomic, strong) NSArray *titles;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor brownColor];
    
    // 创建下拉菜单
    YZPullDownMenu *menu = [[YZPullDownMenu alloc] init];
    menu.frame = CGRectMake(0, 20, YZScreenW, 44);
    [self.view addSubview:menu];
    
    // 设置下拉菜单代理
    menu.dataSource = self;
    
    // 初始化标题
    _titles = @[@"小学",@"排序",@"更多"];
    
    // 添加子控制器
    [self setupAllChildViewController];
}

#pragma mark - 添加子控制器
- (void)setupAllChildViewController
{
    YZAllCourseViewController *allCourse = [[YZAllCourseViewController alloc] init];
    YZSortViewController *sort = [[YZSortViewController alloc] init];
    YZMoreMenuViewController *moreMenu = [[YZMoreMenuViewController alloc] init];
    [self addChildViewController:allCourse];
    [self addChildViewController:sort];
    [self addChildViewController:moreMenu];
}

#pragma mark - YZPullDownMenuDataSource
// 返回下拉菜单多少列
- (NSInteger)numberOfColsInMenu:(YZPullDownMenu *)pullDownMenu
{
    return 3;
}

// 返回下拉菜单每列按钮
- (UIButton *)pullDownMenu:(YZPullDownMenu *)pullDownMenu buttonForColAtIndex:(NSInteger)index
{
    YZMenuButton *button = [YZMenuButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:_titles[index] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:25 /255.0 green:143/255.0 blue:238/255.0 alpha:1] forState:UIControlStateSelected];
    [button setImage:[UIImage imageNamed:@"标签-向下箭头"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"标签-向上箭头"] forState:UIControlStateSelected];
    
    return button;
}

// 返回下拉菜单每列对应的控制器
- (UIViewController *)pullDownMenu:(YZPullDownMenu *)pullDownMenu viewControllerForColAtIndex:(NSInteger)index
{
    return self.childViewControllers[index];
}

// 返回下拉菜单每列对应的高度
- (CGFloat)pullDownMenu:(YZPullDownMenu *)pullDownMenu heightForColAtIndex:(NSInteger)index
{
    // 第1列 高度
    if (index == 0) {
        return 400;
    }
    
    // 第2列 高度
    if (index == 1) {
        return 180;
    }
    
    // 第3列 高度
    return 240;
}


@end
