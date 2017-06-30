//
//  QPDialCodeAreaNameFormat.h
//  QPDialCodePickerView
//
//  Created by pcjbird on 2017/6/29.
//  Copyright © 2017年 Zero Status. All rights reserved.
//

#ifndef QPDialCodeAreaNameFormat_h
#define QPDialCodeAreaNameFormat_h

/**
 * @brief 地区名称显示格式
 */
typedef enum{
    /**
     * @brief 根据当前地区本地化所有地区名称
     */
    QPDialCodeAreaNameFormatCurrentLocale  = 0,
    /**
     * @brief 根据地区自身本地化地区名称
     */
    QPDialCodeAreaNameFormatAreaLocale,
    /**
     * @brief 根据美国(US)地区本地化所有地区名称
     */
    QPDialCodeAreaNameFormatUSLocale,
    
}QPDialCodeAreaNameFormat;

#endif /* QPDialCodeAreaNameFormat_h */
