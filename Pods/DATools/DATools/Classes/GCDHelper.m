//
//  GCDHelper.m
//  DATools
//
//  Created by caowenhui on 2017/12/28.
//  Copyright © 2017年 caowenhui. All rights reserved.
//

#import "GCDHelper.h"

void da_async(dispatch_queue_t queue,void(^block)(void)) {
    dispatch_async(queue, block);
}

void da_sync(dispatch_queue_t queue,void(^block)(void)) {
    dispatch_sync(queue, block);
}

void da_async_global(void(^block)(void)) {
    dispatch_async(da_global_queue, block);
}

void da_async_main(void(^block)(void)) {
    dispatch_async(da_main_queue, block);
}





