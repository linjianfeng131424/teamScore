//
//  Team.m
//  teamScore
//
//  Created by admin on 16/5/19.
//  Copyright © 2016年 内蒙古师范大学. All rights reserved.
//

#import "Team.h"
static Team *team = nil;
@implementation Team
+ (instancetype)shareSingle{

    @synchronized(self) {
        if (team == nil) {
            
            team = [[Team alloc] init];
        }
    }
    return team;
}
@end
