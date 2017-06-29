//
//  ViewController.m
//  QPDialCodePickerViewDemo
//
//  Created by pcjbird on 2017/6/29.
//  Copyright © 2017年 Zero Status. All rights reserved.
//

#import "ViewController.h"
#import <QPDialCodePickerView/QPDialCodePickerView.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btnDialCode;
- (IBAction)OnDialCodeBtnClick:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)OnDialCodeBtnClick:(id)sender {
    __weak typeof (UIButton*) weakBtn = self.btnDialCode;
    QPDialCodePickerView *pickerView = [[QPDialCodePickerView alloc] initWithAreaFormat:QPDialCodeAreaNameFormatCurrentLocale complete:^(QPDialCodeObject *item) {
        [weakBtn setTitle:[NSString stringWithFormat:@"+%@", item.dial_code] forState:UIControlStateNormal];
    }];
    pickerView.roundCorner = YES;
    [pickerView show];
}
@end
