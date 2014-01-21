//
//  HomeViewController.h
//  Dinner
//
//  Created by loohcs on 14-1-21.
//  Copyright (c) 2014年 loohcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *restaurantTV;//显示餐厅信息
@property (nonatomic, strong) NSMutableDictionary *restaurantInfoDic;//存放餐厅的信息
@property (nonatomic, strong) NSMutableArray *restarrantInfoArr;//存放餐厅信息
@end
