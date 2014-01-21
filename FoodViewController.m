//
//  FoodViewController.m
//  Dinner
//
//  Created by loohcs on 14-1-21.
//  Copyright (c) 2014年 loohcs. All rights reserved.
//

#import "FoodViewController.h"

@interface FoodViewController ()

@end

@implementation FoodViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor cyanColor];
    self.navigationItem.title = @"食品";
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 80, 80)];
    NSString *string = [[NSBundle mainBundle] pathForResource:@"[奥特曼]" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:string];
    _imageView.image = image;
    
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView:)];
    tapGR.numberOfTapsRequired = 1;
    [_imageView addGestureRecognizer:tapGR];
    _imageView.userInteractionEnabled = YES;
    [self.view addSubview:_imageView];
    
}

- (void)tapImageView:(UITapGestureRecognizer *)sender
{
    UIImageView *tempImage = [[UIImageView alloc] initWithFrame:CGRectMake(50, 200, 100, 100*0.618)];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"jpg"];
    UIImage *temp = [UIImage imageWithContentsOfFile:path];
    tempImage.image = temp;
    [self.view addSubview:tempImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
