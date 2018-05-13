//
//  Person.h
//  FMDBHelper
//
//  Created by caowenhui on 2017/12/27.
//  Copyright © 2017年 caowenhui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "superPerson.h"
@interface Person : superPerson

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger age;

@property (nonatomic, copy) NSString *addr;


@end
