//
//  ViewController.m
//  利用runtime归档解档
//
//  Created by xgy on 2017/2/4.
//  Copyright © 2017年 com.bijianhuzhu. All rights reserved.
//

#import "ViewController.h"
#import "XGYPerson.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)saveBtnClick:(UIButton *)sender {
    
    //创建一个对象
    XGYPerson *p = [[XGYPerson alloc] init];
    p.name = @"张三";
    p.age = 18;

    NSString *tempPath = NSTemporaryDirectory();
    NSString *filePath = [tempPath stringByAppendingString:@"person.data"];
    
    //归档
    [NSKeyedArchiver archiveRootObject:p toFile:filePath];
}

- (IBAction)readBtnClick:(UIButton *)sender {
    
    NSString *tempPath = NSTemporaryDirectory();
    NSString *filePath = [tempPath stringByAppendingString:@"person.data"];
    XGYPerson *p = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%@",p.name);
    NSLog(@"%d",p.age);
   
}
@end
