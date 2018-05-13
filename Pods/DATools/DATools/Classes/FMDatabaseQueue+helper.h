//
//  FMDatabaseQueue+helper.h
//  FMDBHelper
//
//  Created by caowenhui on 2017/12/28.
//  Copyright © 2017年 caowenhui. All rights reserved.
//

#import <FMDB/FMDB.h>

@interface FMDatabaseQueue (helper)

//便利初始化方法
+ (instancetype)databaseQueueWithName:(NSString *)dbName;

@end
