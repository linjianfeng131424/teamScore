//
//  Team.h
//  teamScore
//
//  Created by admin on 16/5/19.
//  Copyright © 2016年 内蒙古师范大学. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Team : NSObject
@property(nonatomic,copy)NSString *name1;
@property(nonatomic,copy)NSString *name2;
+ (instancetype)shareSingle;

@end
