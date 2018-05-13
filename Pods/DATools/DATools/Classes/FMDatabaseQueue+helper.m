//
//  FMDatabaseQueue+helper.m
//  FMDBHelper
//
//  Created by caowenhui on 2017/12/28.
//  Copyright © 2017年 caowenhui. All rights reserved.
//

#import "FMDatabaseQueue+helper.h"
#import "DATools.h"

@implementation FMDatabaseQueue (helper)

+ (instancetype)databaseQueueWithName:(NSString *)dbName {
     NSString *path = [kDocumentDIR stringByAppendingPathComponent:dbName];
    return [self databaseQueueWithPath:path];
}

@end
