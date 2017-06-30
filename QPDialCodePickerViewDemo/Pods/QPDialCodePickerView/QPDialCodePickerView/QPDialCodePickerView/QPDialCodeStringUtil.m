//
//  QPDialCodeStringUtil.m
//  QPDialCodePickerView
//
//  Created by pcjbird on 2017/6/29.
//  Copyright © 2017年 Zero Status. All rights reserved.
//

#import "QPDialCodeStringUtil.h"

@implementation QPDialCodeStringUtil

+(BOOL) isStringBlank:(NSString*)val
{
    if(!val) return YES;
    if(![val isKindOfClass:[NSString class]]) return YES;
    val = [val stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if([val isEqualToString:@""]) return YES;
    if([val isEqualToString:@"(null)"]) return YES;
    if([val isEqualToString:@"<null>"]) return YES;
    return NO;
}


+(BOOL) isStringHasChineseCharacter:(NSString*)val
{
    if([QPDialCodeStringUtil isStringBlank:val]) return NO;
    for(int i=0; i< [val length];i++)
    {
        int a = [val characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff)
        {
            return YES;
        }
    }
    return NO;
}

@end
