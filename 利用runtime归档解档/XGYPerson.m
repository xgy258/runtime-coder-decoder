//
//  XGYPerson.m
//  利用runtime归档解档
//
//  Created by xgy on 2017/2/4.
//  Copyright © 2017年 com.bijianhuzhu. All rights reserved.
//

#import "XGYPerson.h"
#import <objc/runtime.h>
@implementation XGYPerson
//告诉系统归档哪些属性
-(void)encodeWithCoder:(NSCoder *)aCoder{
    //利用runtime进行归档
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count);
    
    for (int i = 0; i < count; i++) {
        //取出对应的成员变量
        Ivar ivar = ivars[i];
        
        //查看成员变量
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
    }
    free(ivars);
}
//告诉系统要解档哪些属性
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super init];
    if (self) {
        //利用runtime进行解档
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([self class], &count);
        for (int i = 0; i < count; i++) {
            //取出对应的成员变量
            Ivar ivar = ivars[i];
            //查看成员变量
            const char *name = ivar_getName(ivar);
            NSString *key = [NSString stringWithUTF8String:name];
            
            //解档 KVC
            id value = [aDecoder decodeObjectForKey:key];
            //KVC设置上去
            [self setValue:value forKey:key];
        }
        free(ivars);
    }
    return self;
}
@end
