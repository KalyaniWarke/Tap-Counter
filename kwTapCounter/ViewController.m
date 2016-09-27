//
//  ViewController.m
//  kwTapCounter
//
//  Created by Sharmila on 08/09/16.
//  Copyright © 2016 Sharmila. All rights reserved.
//
#define kHeightOfResetButton 80.0
#define kheightOfStatusBar 20.0
#define kHeightToReduceFrom (kHeightOfResetButton + kHeightOfResetButton  )
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    CGFloat heightOfScreen = [[UIScreen mainScreen]bounds].size.height;
    CGFloat widthOfScreen = [[UIScreen mainScreen]bounds].size.width;

    
    CGRect labelNumberFrame =  CGRectMake(0, kheightOfStatusBar , widthOfScreen, heightOfScreen-kHeightOfResetButton );
    
    
    labelNumber = [[UILabel alloc]initWithFrame:labelNumberFrame];
    labelNumber.backgroundColor = [UIColor cyanColor];
    
    [self handleReset];
    
    labelNumber.textAlignment = NSTextAlignmentCenter;
    labelNumber.font = [UIFont systemFontOfSize:60];

    [self.view addSubview:labelNumber];
    
    buttonTap = [[UIButton alloc]initWithFrame:labelNumberFrame];
    [buttonTap addTarget:self action:@selector(handleTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonTap];
    
    CGRect resetButtonFrame = CGRectMake(0, heightOfScreen - kHeightOfResetButton, widthOfScreen, kHeightOfResetButton);
    buttonReset = [[UIButton alloc]initWithFrame:resetButtonFrame];
    [buttonReset setTitle:@"RESET" forState:UIControlStateNormal];
    [buttonReset setTitle:@"RESETING..." forState:UIControlStateHighlighted];
    //[buttonReset setTintColor:UIAccessibilityInvertColorsStatusDidChangeNotification

    [buttonReset setTitleColor:[UIColor blackColor ]forState:UIControlStateNormal];
    [buttonReset setBackgroundColor:[UIColor grayColor]];
    
    [buttonReset addTarget:self action:@selector(handleReset) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:buttonReset];
    
    

    
    
    
}
-(void)handleTap{
    
    NSString *currentValueString = labelNumber.text;
    
     int currentValueInt = currentValueString.intValue;
    
    currentValueInt = currentValueInt + 1;
    NSString *newValueString = [NSString stringWithFormat:@"%d",currentValueInt];
    
    labelNumber.text = newValueString;
    
}

-(void)handleReset{
    labelNumber.text = @"0";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

@end
