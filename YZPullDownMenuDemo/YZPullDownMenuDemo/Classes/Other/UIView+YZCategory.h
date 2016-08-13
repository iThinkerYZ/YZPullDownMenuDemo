
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UIView(YZSize)

@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat maxX;
@property (nonatomic) CGFloat maxY;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;

@end

////////////////////////////////////////////////////////////

@interface UIView(Category)

//获取该视图的控制器
- (UIViewController*) viewController;

//删除当前视图内的所有子视图
- (void) removeChildViews;

//删除tableview底部多余横线
- (void)setExtraCellLineHidden: (UITableView *)tableView;
@end