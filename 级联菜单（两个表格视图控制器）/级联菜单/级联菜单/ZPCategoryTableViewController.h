//
//  ZPCategoryTableViewController.h
//  级联菜单
//
//  Created by apple on 2016/12/12.
//  Copyright © 2016年 apple. All rights reserved.
//

//左侧的表格视图控制器。

#import <UIKit/UIKit.h>

@class ZPCategoryTableViewController;

@protocol ZPCategoryTableViewControllerDelegate <NSObject>

@optional

- (void)categoryTableViewController:(ZPCategoryTableViewController *)categoryTableViewController didSelectSubCategories:(NSArray *)subCategories;

@end

@interface ZPCategoryTableViewController : UITableViewController

@property (nonatomic, weak) id <ZPCategoryTableViewControllerDelegate> delegate;

@end
