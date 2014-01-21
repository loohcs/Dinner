//
//  HomeViewController.m
//  Dinner
//
//  Created by loohcs on 14-1-21.
//  Copyright (c) 2014年 loohcs. All rights reserved.
//

#import "HomeViewController.h"
#import "FoodViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark -- 基础的导航栏定义
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //导航栏定义
    //导航栏左键
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithTitle:@"点餐" style:UIBarButtonItemStylePlain target:self action:@selector(selectFoodForDinner:)];
    //导航栏右键
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:nil];
    
    self.navigationItem.title = @"欢迎光临";
    self.navigationItem.leftBarButtonItem = leftBtn;
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    self.restaurantTV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-20-44) style:UITableViewStylePlain];
    [self.view addSubview:self.restaurantTV];
    
    [self restaurantInfo];
    
}

//导航栏响应方法
- (void)selectFoodForDinner:(UIBarButtonItem *)sender
{
    FoodViewController *foodVC = [[FoodViewController alloc] init];
    [self.navigationController presentViewController:foodVC animated:YES completion:nil];
}

- (void)doneForDinner
{
    NSLog(@"完成订餐！");
}

- (void)restaurantInfo
{
    NSString *string = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [string stringByAppendingPathComponent:@"Info.plist"];
    

    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        _restaurantInfoDic = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
        _restarrantInfoArr = [[NSMutableArray alloc] initWithArray:[_restaurantInfoDic allKeys]];
        
        
        NSLog(@"%@", _restaurantInfoDic);
        NSLog(@"%@", _restarrantInfoArr);
    }
}

#pragma mark -- tableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _restaurantInfoDic.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentify = @"CellIdentify";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentify];
    }
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
