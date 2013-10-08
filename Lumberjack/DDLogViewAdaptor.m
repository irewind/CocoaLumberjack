//
//  DDLogNSLogger.m
//  iRewind
//
//  Created by Walter Fettich on 02.09.13.
//  Copyright (c) 2013 i-Rewind SRL. All rights reserved.
//

#import "DDLogViewAdaptor.h"

@interface DDLogViewAdaptor ()
@end

@implementation DDLogViewAdaptor
{
    
}

+ (instancetype) sharedInstance {
    static DDLogViewAdaptor *sharedLogger;
    static dispatch_once_t onceLock;
    dispatch_once(&onceLock, ^{
        sharedLogger = [[DDLogViewAdaptor alloc] init];
    });
    
    return sharedLogger;
}


-(instancetype)init
{
    if (self = [super init])
    {
        self.logArray = [@[]mutableCopy];
    }
    
    return self;
}

- (void)logMessage:(DDLogMessage *)logMessage {
    NSString *logMsg = logMessage->logMsg;
    
    if (self->formatter)
        logMsg = [self.logFormatter formatLogMessage:logMessage];
    
    if (logMsg)
    {
        [self.logArray addObject:logMsg];
        [[NSNotificationCenter defaultCenter] postNotificationName:kNewLogEntryNotification object:self userInfo:@{kLogEntryParam:logMsg}];
    }
}

@end