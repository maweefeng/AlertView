//
//  AlertView.m
//  AlertView
//
//  Created by Weefeng Ma on 2018/1/3.
//  Copyright © 2018年 maweefeng. All rights reserved.
//

#import "AlertView.h"

@interface AlertView()
@property (nonatomic, strong) UIView* greyView;
@property (nonatomic, copy) NSMutableArray* listArr;
@property (nonatomic, strong) UILabel* tipLabel;


@end
@implementation AlertView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        
        [self initSubViews];
        UIGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
        [self addGestureRecognizer:tap];
    }
    
    return self;
}
-(instancetype)init{
    
    
    if (self = [super init]) {
        [self initSubViews];
    }
    return self;
}

-(NSMutableArray *)listArr{
    
    if (!_listArr) {
        _listArr = [NSMutableArray arrayWithObjects:@"相册",@"拍照", @"取消",nil];
    }
    return _listArr;
}

#pragma mark 初始化子控件
-(void)initSubViews{
    
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    self.greyView = [[UIView alloc]init];
    [self addSubview:self.greyView];
    self.greyView.backgroundColor = [UIColor lightGrayColor];
    [self.greyView setFrame:CGRectMake(0, SCREENHEIGHT-self.listArr.count*ButtonHeight-tipHeight+self.listArr.count*ButtonHeight+self.listArr.count* margin+tipHeight, SCREENWIDTH, self.listArr.count*ButtonHeight+self.listArr.count* margin+tipHeight)];
    self.tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, tipHeight)];
    self.tipLabel.textAlignment = NSTextAlignmentCenter;
    self.tipLabel.textColor = [UIColor blackColor];
    self.tipLabel.backgroundColor = [UIColor whiteColor];
    self.tipLabel.text = @"请选择照片来源";
    [self.greyView addSubview:self.tipLabel];
    for (int i = 0; i<self.listArr.count; i++) {
        UIButton * button =[UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        button.backgroundColor = [UIColor whiteColor];
        [button setFrame:CGRectMake(0, tipHeight+button.tag+1+button.tag*ButtonHeight, SCREENWIDTH, ButtonHeight)];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitle:self.listArr[i] forState:UIControlStateNormal];
        [self.greyView addSubview:button];
    }
    self.hidden = YES;

    
}
-(void)dismiss{
    
    [UIView animateWithDuration:1 animations:^{
        [self.greyView setFrame:CGRectMake(0, SCREENHEIGHT-self.listArr.count*ButtonHeight-tipHeight+self.listArr.count*ButtonHeight+self.listArr.count* margin+tipHeight, SCREENWIDTH, self.listArr.count*ButtonHeight+self.listArr.count* margin+tipHeight)];
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
    
}

-(void)show{
    self.hidden = NO;
    
    [UIView animateWithDuration:1 animations:^{
        [self.greyView setFrame:CGRectMake(0, SCREENHEIGHT-self.listArr.count*ButtonHeight-tipHeight, SCREENWIDTH, self.listArr.count*ButtonHeight+self.listArr.count* margin+tipHeight)];
        
    }];
}

@end
