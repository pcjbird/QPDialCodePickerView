//
//  QPDialCodePickerView.h
//  QPDialCodePickerView
//
//  Created by pcjbird on 2017/6/29.
//  Copyright © 2017年 Zero Status. All rights reserved.
//
//  框架名称:国际区号选择器
//  框架功能:选择国籍区号
//  修改记录:
//     pcjbird    2017-07-04  Version:1.0.2 Build:201707040001
//                            1.Carthage支持。
//     pcjbird    2017-06-30  Version:1.0.1 Build:201706300001
//                            1.CocoaPods支持。
//     pcjbird    2017-06-29  Version:1.0.0 Build:201706290001
//                            1.第一个版本。


#import <UIKit/UIKit.h>

//! Project version number for QPDialCodePickerView.
FOUNDATION_EXPORT double QPDialCodePickerViewVersionNumber;

//! Project version string for QPDialCodePickerView.
FOUNDATION_EXPORT const unsigned char QPDialCodePickerViewVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <QPDialCodePickerView/PublicHeader.h>
#import <QPDialCodePickerView/QPDialCodeObject.h>
#import <QPDialCodePickerView/QPDialCodeAreaNameFormat.h>

/**
 * @brief 国际区号选择器结果回调block
 */
typedef void(^QPDialCodePickerViewResultBlock)(QPDialCodeObject * item);

/**
 * @brief 国际区号选择器
 */
@interface QPDialCodePickerView : UIView

/**
 * @brief 确定按钮背景颜色
 */
@property (nonatomic, strong) UIColor *doneButtonColor;

/**
 * @brief 确定按钮标题
 */
@property (nonatomic, strong) NSString *doneButtonTitle;

/**
 * @brief 地区名称显示格式
 */
@property (nonatomic, assign) QPDialCodeAreaNameFormat  areaFormat;

/**
 * @brief 是否显示灰色背景蒙版
 */
@property (nonatomic, assign) BOOL grayMaskBack;

/**
 * @brief 是否圆角显示
 */
@property (nonatomic, assign) BOOL roundCorner;


/**
 * @brief 初始化国际区号选择器
 * @param format 地区名称显示格式
 * @param complete 选择结果回调block
 */
-(instancetype)initWithAreaFormat:(QPDialCodeAreaNameFormat)format complete:(QPDialCodePickerViewResultBlock)complete;

/**
 * @brief 显示国际区号选择器
 */
-(void)show;

/**
 *@brief 版本号
 *@return 版本号
 */
+ (NSString*)version;

/**
 *@brief 获取 Build 版本号
 *@return Build 版本号
 */
+ (NSString*)buildVersion;

/**
 *@brief 获取当前地区国际区号
 *@return 当前地区国际区号
 */
+ (NSString*)currentLocaleDialCode;

@end


