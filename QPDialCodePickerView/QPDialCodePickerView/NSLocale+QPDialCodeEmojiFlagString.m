//
//  NSLocale+QPDialCodeEmojiFlagString.m
//  QPDialCodePickerView
//
//  Created by pcjbird on 2017/6/29.
//  Copyright © 2017年 Zero Status. All rights reserved.
//

#import "NSLocale+QPDialCodeEmojiFlagString.h"

@implementation NSLocale (QPDialCodeEmojiFlagString)

+ (NSString *)emojiFlagForISOCountryCode:(NSString *)countryCode {
    
    if(![countryCode isKindOfClass:[NSString class]] || countryCode.length != 2 || [countryCode isEqualToString:@"TW"]) return @"";
    int base = 127462 -65;
    
    wchar_t bytes[2] = {
        base +[countryCode characterAtIndex:0],
        base +[countryCode characterAtIndex:1]
    };
    
    return [[NSString alloc] initWithBytes:bytes
                                    length:countryCode.length *sizeof(wchar_t)
                                  encoding:NSUTF32LittleEndianStringEncoding];
}

@end
