//
//  FMDBModel.h
//  163News
//
//  Created by lanou3g on 16/3/10.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "Score.h"
@interface FMDBModel : NSObject
+ (FMDBModel *)defaultFMDBModel;

// 插入
- (void)insertScore:(Score *)score;
// 拿到所有数据
- (NSMutableArray *)getAllTeamScore;
// 根据唯一标示获取对象
-(Score *)getOneScoreWithName:(NSString*)scoreName;
@end
