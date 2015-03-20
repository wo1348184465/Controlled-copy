//
//  ViewController.m
//  禁用剪切板
//
//  Created by 小伍 on 15-3-11.
//  Copyright (c) 2015年 小伍. All rights reserved.
//

#import "ViewController.h"
#import "NoUITextField.h"
@interface ViewController ()<UITextViewDelegate>
{
    UISwitch * witch;
    
}
@property (nonatomic , strong   ) UITextView * textField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NoUITextField * noTextField = [[NoUITextField alloc]initWithFrame:CGRectMake(100, 100, 200, 40)];
    [noTextField setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:noTextField];
    
    witch = [[UISwitch alloc]initWithFrame:CGRectMake(50, 100, 50, 40)];
    [self.view addSubview:witch];
    [witch addTarget:self action:@selector(switchAction) forControlEvents:UIControlEventValueChanged];
    [witch addObserver:self forKeyPath:@"on" options:NSKeyValueObservingOptionOld context:nil];
    
    UITextField * text = [[UITextField alloc]initWithFrame:CGRectMake(100, 250, 200, 40)];
    [text setBackgroundColor:[UIColor colorWithRed:0.705 green:0.566 blue:1.000 alpha:1.000]];
    [self.view addSubview:text];
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)switchAction
{
    if (witch.on == YES) {
        NSLog(@"111");

        [[NSNotificationCenter defaultCenter]postNotificationName:@"shuxing" object:@"yes"];
        
    }
    else
    {
        NSLog(@"222");
        [[NSNotificationCenter defaultCenter]postNotificationName:@"shuxing" object:@"no"];
    }
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"shuxing" object:nil];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"on"]) {
        NSLog(@"改变了");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
