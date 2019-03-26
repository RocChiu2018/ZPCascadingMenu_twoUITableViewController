//
//  ViewController.m
//  级联菜单
//
//  Created by apple on 2016/12/12.
//  Copyright © 2016年 apple. All rights reserved.
//

/**
 级联菜单有多种做法，这个Demo主要是在底层的视图控制器上面加上左右两个表格视图控制器。
 */
#import "ViewController.h"
#import "ZPCategoryTableViewController.h"
#import "ZPSubCategoryTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //设置两个表格视图控制器的宽和高
    CGFloat width = self.view.frame.size.width * 0.5;
    CGFloat height = self.view.frame.size.height;
    
    /**
     设置右侧的表格视图控制器：
     */
    ZPSubCategoryTableViewController *subCategoryVC = [[ZPSubCategoryTableViewController alloc] init];
    subCategoryVC.view.frame = CGRectMake(width, 0, width, height);
    [self addChildViewController:subCategoryVC];  //先把子视图控制器加到父视图控制器中
    [self.view addSubview:subCategoryVC.view];  //再把子视图控制的view加到父视图控制器的view上
    
    /**
     设置左侧的表格视图控制器：
     */
    ZPCategoryTableViewController *categoryVC = [[ZPCategoryTableViewController alloc] init];
    categoryVC.view.frame = CGRectMake(0, 0, width, height);
    categoryVC.delegate = subCategoryVC;  //设置代理，便于以后传值
    [self addChildViewController:categoryVC];
    [self.view addSubview:categoryVC.view];
}

@end
