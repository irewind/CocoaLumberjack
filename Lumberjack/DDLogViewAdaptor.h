//
//  DDLogNSLogger.h
//  iRewind
//
//  Created by Walter Fettich on 02.09.13.
//  Copyright (c) 2013 i-Rewind SRL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDLog.h"

#define kNewLogEntryNotification @"NewLogEntryNotification"
#define kLogEntryParam @"entry"

@interface DDLogViewAdaptor : DDAbstractLogger<DDLogger>
+ (id)sharedInstance;
@property (nonatomic,strong) NSMutableArray* logArray;
@end