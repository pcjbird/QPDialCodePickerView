//
//  QPDialCodePickerViewDefine.h
//  QPDialCodePickerView
//
//  Created by pcjbird on 2017/6/29.
//  Copyright © 2017年 Zero Status. All rights reserved.
//

#ifndef QPDialCodePickerViewDefine_h
#define QPDialCodePickerViewDefine_h

#define QPDCPV_VERSION   @"1.0.2"

#define QPDCPV_BUILD_VERSION   @"201707040001"

#define kQPDCPVScreenWidth [UIScreen mainScreen].bounds.size.width
#define kQPDCPVScreenHeight [UIScreen mainScreen].bounds.size.height

//KeyWindow
#define KeyWindow                           [[UIApplication sharedApplication] keyWindow]

//颜色
#define RGB(r, g, b)                        [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define QP_DCPV_BUNDLE [NSBundle bundleWithPath:[[NSBundle bundleForClass:[self class]] pathForResource:@"QPDialCodePickerView" ofType:@"bundle"]]

#define QP_DCPV_LocalizedString(key) NSLocalizedStringFromTableInBundle(key, @"QPDialCodePickerView", QP_DCPV_BUNDLE, nil)


#endif /* QPDialCodePickerViewDefine_h */

