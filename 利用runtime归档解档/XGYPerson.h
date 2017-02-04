//
//  XGYPerson.h
//  利用runtime归档解档
//
//  Created by xgy on 2017/2/4.
//  Copyright © 2017年 com.bijianhuzhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XGYPerson : NSObject<NSCoding>
/** 名字 */
@property(copy,nonatomic)NSString * name;
/** 年龄 */
@property(assign,nonatomic)int age;

@end
