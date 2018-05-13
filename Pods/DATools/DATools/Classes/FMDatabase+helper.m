//
//  FMDatabase+helper.m
//  FMDBHelper
//
//  Created by caowenhui on 2017/12/27.
//  Copyright © 2017年 caowenhui. All rights reserved.
//

#import "FMDatabase+helper.h"
#import "DATools.h"
#import "MJExtension.h"

@implementation FMDatabase (helper)

+ (instancetype)databaseWithName:(NSString *)dbName {
    NSString *path = [kDocumentDIR stringByAppendingPathComponent:dbName];
    return [self databaseWithPath:path];
}

- (BOOL)addObject:(id)object {
    NSParameterAssert(object);
    NSString *tableName = NSStringFromClass([object class]);
    NSDictionary *dict = [object mj_keyValues];
    NSString *sql1 = [NSString stringWithFormat:@"INSERT INTO %@",tableName];
    NSString *colums = @"";
    NSString *values = @"";
    NSArray *keys = [dict allKeys];
    for (NSInteger i=0 ; i<keys.count; i++) {
        if (i==0) {
            colums = [NSString stringWithFormat:@"%@",keys[0]];
        } else {
            colums = [colums stringByAppendingFormat:@",%@",keys[i]];
        }
        if (i==0) {
            values = [NSString stringWithFormat:@":%@",keys[0]];
        } else {
            values = [values stringByAppendingFormat:@",:%@",keys[i]];
        }
    }
    NSString *sql = [NSString stringWithFormat:@"%@ (%@) VALUES(%@)",sql1, colums, values];
    return [self executeUpdate:sql withParameterDictionary:dict];
}

- (NSArray *)objectsWithClass:(Class)modelClass where:(NSString *)where {
    NSParameterAssert(modelClass);
    NSString *tableName = NSStringFromClass(modelClass);
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@",tableName];
    if (where) {
        sql = [sql stringByAppendingFormat:@" WHERE %@",where];
    }
    FMResultSet *set = [self executeQuery:sql];
    NSMutableArray *array = [NSMutableArray array];
    while ([set next]) {
        NSDictionary *result = set.resultDictionary;
        if (!result) {
            continue;
        }
        id modelObject = [modelClass mj_objectWithKeyValues:result];
        [array addObject:modelObject];
    }
    return array;
}

- (BOOL)updateWithDictionary:(NSDictionary *)dict modelClass:(nonnull Class)modelClass where:(nullable NSString *)where {
    NSParameterAssert(modelClass);
    NSCParameterAssert(dict);
    NSString *tableName = NSStringFromClass(modelClass);
    NSString *placeholders = @"";
    NSArray *keys = [dict allKeys];
    for (NSInteger i=0 ; i<keys.count; i++) {
        if (i==0) {
            placeholders = [NSString stringWithFormat:@"%@=:%@",keys[0],keys[0]];
        } else {
            placeholders = [placeholders stringByAppendingFormat:@"%@=:%@",keys[i],keys[i]];
        }
    }
    NSString *sql = [NSString stringWithFormat:@"UPDATE %@ SET %@",tableName, placeholders];
    if (where) {
        sql = [sql stringByAppendingFormat:@" WHERE %@",where];
    }
    return [self executeUpdate:sql withParameterDictionary:dict];
}

- (BOOL)deleteObjectWithModelClass:(Class)modelClass where:(NSString *)where {
    NSParameterAssert(modelClass);
    NSString *tableName = NSStringFromClass(modelClass);
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM %@",tableName];
    if (where) {
        sql = [sql stringByAppendingFormat:@" WHERE %@",where];
    }
    
    return [self executeUpdate:sql];
}

- (BOOL)isTableExistWithName:(NSString *)tableName {
    FMResultSet *rs = [self executeQuery:@"select count(*) as 'count' from sqlite_master where type ='table' and name = ?", tableName];
    while ([rs next])
    {
        // just print out what we've got in a number of formats.
        NSInteger count = [rs intForColumn:@"count"];
        DLog(@"isTableOK %ld", count);
        if (0 == count) {
            return NO;
        } else {
            return YES;
        }
    }
    return NO;
}

@end
