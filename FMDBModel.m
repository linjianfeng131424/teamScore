//
//  FMDBModel.m
//  163News
//
//  Created by lanou3g on 16/3/10.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "FMDBModel.h"

@implementation FMDBModel
{
    FMDatabase *fmdb;
}
+ (FMDBModel *)defaultFMDBModel
{
    static FMDBModel *fmdb = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        fmdb = [[FMDBModel alloc] init];
    });
    return fmdb;
}
-(id)init
{
    if(self=[super init])
    {
        NSString *documenPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
        //数据库存储路径
        NSString *dbpath=[documenPath stringByAppendingPathComponent:@"teamScore.db"];
        NSLog(@"%@",dbpath);
        fmdb = [FMDatabase databaseWithPath:dbpath];
        //尝试打开数据库
        if([fmdb open])
        {
            [self createTable];
            
        }
    }
    return self;
}
//数据库建表
-(void)createTable
{
    NSArray *allArray = [NSArray arrayWithObjects:
                       @"CREATE TABLE IF NOT EXISTS Score (name Varchar DEFAULT NULL,score Varchar DEFAULT NULL,firstScore Varchar DEFAULT NULL,secondScore Varchar DEFAULT NULL,thirdScore Varchar DEFAULT NULL)",
                       
                       nil];
    for(NSString *sql in allArray)
    {
        //建表，增、删、改都用这个方法
        if([fmdb executeUpdate:sql])
        {
            NSLog(@"创建成功");
        }
        else
        {
            NSLog(@"建表失败");
        }
    }
}

// 插入好友信息
- (void)insertScore:(Score *)score
{
    NSString *sql=[NSString stringWithFormat:@"insert into Score (name,score,firstScore,secondScore,thirdScore) values (?,?,?,?,?)"];
    if (sql) {
        [fmdb executeUpdate:sql,score.name,score.score,score.firstScore,score.secondScore,score.thirdScore];
    }
    NSLog(@"插入结果:%@",[fmdb lastErrorMessage]);
    
}
// 根据唯一标示获取对象
-(Score *)getOneScoreWithName:(NSString*)scoreName
{
    FMResultSet *rs=[fmdb executeQuery:@"SELECT * FROM Score where name=?",scoreName];
    Score *score=[[Score alloc]init];
    while ([rs next]){
        score.name = [rs stringForColumn:@"name"];
        score.score = [rs stringForColumn:@"score"];
        score.firstScore = [rs stringForColumn:@"firstScore"];
        score.secondScore = [rs stringForColumn:@"secondScore"];
        score.thirdScore = [rs stringForColumn:@"thirdScore"];
    }
    return score;
}
// 拿到所有数据
- (NSMutableArray *)getAllTeamScore
{
    NSMutableArray *arr=[NSMutableArray array];
    FMResultSet *rs=[fmdb executeQuery:@"SELECT * FROM Score"];
    while ([rs next]){
        Score *score=[[Score alloc]init];
        score.name = [rs stringForColumn:@"name"];
        score.score = [rs stringForColumn:@"score"];
        score.firstScore = [rs stringForColumn:@"firstScore"];
        score.secondScore = [rs stringForColumn:@"secondScore"];
        score.thirdScore = [rs stringForColumn:@"thirdScore"];
        [arr addObject:score];
    }
    return arr;
}
@end
