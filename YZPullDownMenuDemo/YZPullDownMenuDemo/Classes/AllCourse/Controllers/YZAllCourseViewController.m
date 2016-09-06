//
//  YZAllCourseViewController.m
//  PullDownMenu
//
//  Created by yz on 16/8/12.
//  Copyright © 2016年 yz. All rights reserved.
//

#import "YZAllCourseViewController.h"
extern NSString * const YZUpdateMenuTitleNote;
static NSString * const categoryID = @"categoryID";
static NSString * const categoryDetailID = @"categoryDetailID";

@interface YZAllCourseViewController ()
/**
 *  分类tableView
 */
@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;
/**
 *  分类详情tableView
 */
@property (weak, nonatomic) IBOutlet UITableView *categoryDetailTableView;

@property (strong, nonatomic) NSString *selectedCategory;

@end

@implementation YZAllCourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    [self.categoryTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:categoryID];
    [self.categoryDetailTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:categoryDetailID];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
    [self.categoryTableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    [self tableView:self.categoryTableView didSelectRowAtIndexPath:indexPath];
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.categoryTableView) {
        // 左边的类别表格 👈
        return 5;
        
    } else {
        // 右边的类别详情表格 👉
        return 10;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.categoryTableView) {
        // 左边的类别表格 👈
        UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:categoryID];
        cell.textLabel.text = [NSString stringWithFormat:@"小学%ld",indexPath.row];
        return cell;
    }
    
    // 右边的类别详情表格 👉
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:categoryDetailID];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ : 详%ld",_selectedCategory,indexPath.row];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.categoryTableView) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        // 左边的类别表格 👈
        _selectedCategory = cell.textLabel.text;
        
        // 刷新右边数据
        [self.categoryDetailTableView reloadData];
        
        return;
    }
    
    // 右边的类别详情表格 👉
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    // 更新菜单标题
    [[NSNotificationCenter defaultCenter] postNotificationName:YZUpdateMenuTitleNote object:self userInfo:@{@"title":cell.textLabel.text}];
}



@end
