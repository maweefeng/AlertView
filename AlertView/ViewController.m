//
//  ViewController.m
//  AlertView
//
//  Created by Weefeng Ma on 2018/1/3.
//  Copyright © 2018年 maweefeng. All rights reserved.
//

#import "ViewController.h"
#import "AlertView.h"
@interface ViewController ()
@property (nonatomic, strong) AlertView*  alert;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"show alert" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(100, 100, 200, 50)];
    btn.center = self.view.center;
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(showAlert) forControlEvents:UIControlEventTouchUpInside];
    self.alert = [[AlertView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.alert];
}
-(void)showAlert{
    
    [self.alert show];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
