//
//  NSLocale+QPDialCodeEmojiFlagString.h
//  QPDialCodePickerView
//
//  Created by pcjbird on 2017/6/29.
//  Copyright © 2017年 Zero Status. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSLocale (QPDialCodeEmojiFlagString)

+ (NSString *)emojiFlagForISOCountryCode:(NSString *)countryCode;

@end
