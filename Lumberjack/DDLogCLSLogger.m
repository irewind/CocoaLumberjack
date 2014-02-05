//
//  DDLogNSLogger.m
//  iRewind
//
//  Created by Walter Fettich on 02.09.13.
//  Copyright (c) 2013 i-Rewind SRL. All rights reserved.
//

#import "DDLogCLSLogger.h"
#import <Crashlytics/Crashlytics.h>

@implementation DDLogCLSLogger {
    
}

+ (instancetype) sharedInstance {
    static DDLogCLSLogger *sharedLogger;
    static dispatch_once_t onceLock;
    dispatch_once(&onceLock, ^{
        sharedLogger = [[DDLogCLSLogger alloc] init];
    });
    
    return sharedLogger;
}

- (void)logMessage:(DDLogMessage *)logMessage {
    NSString *logMsg = logMessage->logMsg;
    
    if (self->formatter)
        logMsg = [self.logFormatter formatLogMessage:logMessage];
    
    if (logMsg)
    {
        CLSLog(@"%@", logMsg);
    }
}

@end