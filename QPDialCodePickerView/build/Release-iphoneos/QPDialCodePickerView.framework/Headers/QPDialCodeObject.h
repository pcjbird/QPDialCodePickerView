//
//  QPDialCodeObject.h
//  QPDialCodePickerView
//
//  Created by pcjbird on 2017/6/29.
//  Copyright © 2017年 Zero Status. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * @brief 国际区号相关数据信息
 */
@interface QPDialCodeObject : NSObject

/**
 * @brief 国际区号
 */
@property(nonatomic, strong) NSString* dial_code;

/**
 * @brief 国家或地区名称
 */
@property(nonatomic, strong) NSString* area_name;

/**
 * @brief 国旗emoji符号
 */
@property(nonatomic, strong) NSString* flag;

@end
