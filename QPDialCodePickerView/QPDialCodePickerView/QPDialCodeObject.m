//
//  QPDialCodeObject.m
//  QPDialCodePickerView
//
//  Created by pcjbird on 2017/6/29.
//  Copyright © 2017年 Zero Status. All rights reserved.
//

#import "QPDialCodeObject.h"
#import "QPDialCodeStringUtil.h"

@implementation QPDialCodeObject

-(NSString *)description
{
    return [NSString stringWithFormat:@"%@ +%@ %@", [QPDialCodeStringUtil isStringBlank:self.flag] ? @"" : self.flag, self.dial_code, self.area_name];
}

@end
