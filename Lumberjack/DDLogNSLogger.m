//
//  DDLogNSLogger.m
//  iRewind
//
//  Created by Walter Fettich on 02.09.13.
//  Copyright (c) 2013 i-Rewind SRL. All rights reserved.
//

#import "DDLogNSLogger.h"

@implementation DDLogNSLogger {
    
}

+ (instancetype) sharedInstance {
    static DDLogNSLogger *sharedLogger;
    static dispatch_once_t onceLock;
    dispatch_once(&onceLock, ^{
        sharedLogger = [[DDLogNSLogger alloc] init];
    });
    
    return sharedLogger;
}

- (void)logMessage:(DDLogMessage *)logMessage {
    NSString *logMsg = logMessage->logMsg;
    
    if (self->formatter)
        logMsg = [self.logFormatter formatLogMessage:logMessage];
    
    if (logMsg)
    {
        NSLog(@"%@", logMsg);
    }
}

@end