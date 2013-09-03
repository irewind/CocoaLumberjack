//
//  DDLogNSLogger.h
//  iRewind
//
//  Created by Walter Fettich on 02.09.13.
//  Copyright (c) 2013 i-Rewind SRL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDLog.h"

@interface DDLogNSLogger : DDAbstractLogger<DDLogger>
+ (id)sharedInstance;

@end