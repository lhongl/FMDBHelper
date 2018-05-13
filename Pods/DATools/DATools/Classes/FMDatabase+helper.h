//
//  FMDatabase+helper.h
//  FMDBHelper
//
//  Created by caowenhui on 2017/12/27.
//  Copyright © 2017年 caowenhui. All rights reserved.
//

#import <FMDB/FMDB.h>

NS_ASSUME_NONNULL_BEGIN

@interface FMDatabase (helper)

//便利初始化方法
+ (instancetype)databaseWithName:(NSString *)dbName;

/**
 插入数据
 
 @param object 模型对象，数据库模型类，模型类类名必须与表名保持一致，属性名与数据库字段名保持一致
 @return 操作是否成功
 */
- (BOOL)addObject:(id)object;

/**
 查询数据

 @param modelClass 模型类(表名)
 @param where 查询条件
 @return 返回结果数组
 */
- (NSArray *)objectsWithClass:(Class)modelClass where:(nullable NSString *)where;

/**
 更新数据

 @param dict 需要更新的字段和值
 @param modelClass 模型类（表名）
 @param where 条件语句
 @return 操作是否成功
 */
- (BOOL)updateWithDictionary:(NSDictionary *)dict modelClass:(Class)modelClass where:(nullable NSString *)where;



/**
  删除数据

 @param modelClass 模型类（表名）
 @param where 条件语句
 @return 操作是否成功
 */
- (BOOL)deleteObjectWithModelClass:(Class)modelClass where:(nullable NSString *)where;


/**
 检查表是否存在

 @param tableName 表名
 @return 返回是否存在
 */
- (BOOL)isTableExistWithName:(NSString *)tableName;

@end

NS_ASSUME_NONNULL_END
