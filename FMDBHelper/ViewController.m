//
//  ViewController.m
//  FMDBHelper
//
//  Created by caowenhui on 2017/12/26.
//  Copyright © 2017年 caowenhui. All rights reserved.
//

#import "ViewController.h"
#import "FMDatabase+helper.h"
#import "FMDatabaseQueue+helper.h"
#import "Person.h"
#import "DATools.h"
#import "superPerson.h"
@interface ViewController ()
{
    FMDatabase *_db;
    FMDatabaseQueue *_queue;
}
    @property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;
    
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _db = [FMDatabase databaseWithName:@"test.db"];
    _queue = [FMDatabaseQueue databaseQueueWithName:@"test.db"];
    if (![_db open]) {
        
        NSLog(@"数据库打开失败");
    }
    NSLog(@">>>>>>>%@",kDocumentDIR);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clicked:(id)sender {
    NSString *sql = @"CREATE TABLE IF NOT EXISTS 'Person' ('id' INTEGER PRIMARY KEY AUTOINCREMENT, 'name' TEXT, 'age' INTEGER, 'addr' TEXT)";
    [_db executeUpdate:sql];
    DLog(@"创建数据库表！");
}

- (IBAction)add:(id)sender {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        da_async_main(^{
            [_indicatorView startAnimating];
        });
        CFAbsoluteTime startTime =CFAbsoluteTimeGetCurrent();
        NSUInteger count = 500000;
        [_queue inTransaction:^(FMDatabase * _Nonnull db, BOOL * _Nonnull rollback) {
            for (NSInteger i=0; i< count; i++) {
                Person *p = [[Person alloc] init];
                p.name = [NSString createGUID];
                p.age = i;
                p.addr = [NSString createGUID];
                [db addObject:p];
                if (db.hadError) {
                    DLog(@"出错了！");
                    *rollback = YES;
                    break;
                }
            }
        }];
        CFAbsoluteTime linkTime = (CFAbsoluteTimeGetCurrent() - startTime);
        DLog(@"插入 %ld 条数据，共耗时 %f seconds",count,linkTime);
        da_async_main(^{
            [_indicatorView stopAnimating];
        });
    });
    
    
}
- (IBAction)del:(id)sender {
    BOOL ret = [_db deleteObjectWithModelClass:[Person class] where:@"id=3"];
    if (ret) {
        DLog(@"操作成功！");
    } else {
        DLog(@"操作失败！");
    }
}
- (IBAction)update:(id)sender {
    BOOL ret = [_db updateWithDictionary:@{@"name":@"曹文辉"} modelClass:[Person class] where:@"id=1"];
    if (ret) {
        DLog(@"操作成功！");
    } else {
        DLog(@"操作失败！");
    }
}
- (IBAction)select:(id)sender {
     NSString *sql = [NSString stringWithFormat:@"%@ like '%%%@%%' ",@"id",@"10"];
    NSArray *arr = [_db objectsWithClass:[Person class] where:sql];
    for (Person *persson in arr) {
        NSLog(@"=============%ld",persson.age);
    }
    DLog(@"结果：%@",arr);
}

- (NSArray *)getSelect:(superPerson *)person{
    NSString *sql = [NSString stringWithFormat:@"%@ like '%%%@%%' ",@"id",@"10"];
    NSArray *arr = [_db objectsWithClass:[Person class] where:sql];
    return arr;
}

@end
