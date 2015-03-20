//
//  NoUITextField.m
//  禁用剪切板
//
//  Created by 小伍 on 15-3-11.
//  Copyright (c) 2015年 小伍. All rights reserved.
//

#import "NoUITextField.h"

@interface NoUITextField ()
{
    BOOL  value;
}
@end


@implementation NoUITextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(SwitchAction:) name:@"shuxing" object:nil];
        
    }
    return self;
}
- (void)SwitchAction:(NSNotification *)obj;
{
    if ([obj.object isEqualToString:@"yes"]) {
        value = YES;
    }
    else{
        value = NO;
    }
    
}
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
//    UIMenuController *menuController = [UIMenuController sharedMenuController];
//    if (menuController) {
//        [UIMenuController sharedMenuController].menuVisible = NO;
//    }
    
    return value;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
