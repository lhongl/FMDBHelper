//
//  GCDHelper.h
//  DATools
//
//  Created by caowenhui on 2017/12/28.
//  Copyright © 2017年 caowenhui. All rights reserved.
//

#import <Foundation/Foundation.h>
//默认全局并发队列
#define da_global_queue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
//主线程队列
#define da_main_queue dispatch_get_main_queue()
//自定义并发队列
#define da_current_queue(label) dispatch_queue_create(label, DISPATCH_QUEUE_CONCURRENT)
//自定义串形队列
#define da_serial_quque(label) dispatch_queue_create(label, DISPATCH_QUEUE_SERIAL)

//异步
extern void da_async(dispatch_queue_t queue,void(^block)(void));
//异步并发
extern void da_async_global(void(^block)(void));
//异步执行主线程队列
extern void da_async_main(void(^block)(void));
//同步
extern void da_sync(dispatch_queue_t queue,void(^block)(void));

