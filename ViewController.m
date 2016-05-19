//
//  ViewController.m
//  teamScore
//
//  Created by admin on 16/5/19.
//  Copyright © 2016年 内蒙古师范大学. All rights reserved.
//

#import "ViewController.h"
#import "GameBeginViewController.h"
#import "Team.h"
@interface ViewController ()

@property(nonatomic,strong)UITextField *name1;
@property(nonatomic,strong)UITextField *name2;
@property(nonatomic,strong)UIButton *beginBT;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"比赛登记";
    [self initLayout];
}
- (void)initLayout{

    self.name1 = [[UITextField alloc] initWithFrame:CGRectMake(30, 150, 150, 50)];
    self.name1.backgroundColor = [UIColor cyanColor];
    self.name1.placeholder = @"请输入比赛队队名";
    [self.view addSubview:self.name1];
    
    self.name2 = [[UITextField alloc] initWithFrame:CGRectMake(235, 150, 150, 50)];
    self.name2.backgroundColor = [UIColor cyanColor];
    self.name2.placeholder = @"请输入比赛队队名";
    [self.view addSubview:self.name2];
    
    self.beginBT = [UIButton buttonWithType:UIButtonTypeSystem];
    self.beginBT.frame = CGRectMake(155, 240, 100, 30);
    self.beginBT.backgroundColor = [UIColor cyanColor];
    [self.beginBT setTitle:@"开始比赛" forState:UIControlStateNormal];
    [self.beginBT setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:self.beginBT];
    [self.beginBT addTarget:self action:@selector(beginAction) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)beginAction{

    GameBeginViewController *gameVC = [[GameBeginViewController alloc] init];
    Team *team = [Team shareSingle];
    team.name1 = self.name1.text;
    team.name2 = self.name2.text;
    [self.navigationController pushViewController:gameVC animated:YES];

}
















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
