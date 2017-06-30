//
//  QPDialCodePickerViewDataSource.h
//  QPDialCodePickerView
//
//  Created by pcjbird on 2017/6/29.
//  Copyright © 2017年 Zero Status. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QPDialCodeObject.h"
#import "QPDialCodeAreaNameFormat.h"

@interface QPDialCodePickerViewDataSource : NSObject



+ (QPDialCodePickerViewDataSource*)sharedInstance;

-(NSArray<QPDialCodeObject*> *)dataSourceWithFormat:(QPDialCodeAreaNameFormat)format;

@end
