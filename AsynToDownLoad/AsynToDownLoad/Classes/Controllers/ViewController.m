//
//  ViewController.m
//  AsynToDownLoad
//
//  Created by 胡坤 on 2016/12/11.
//  Copyright © 2016年 hukun. All rights reserved.
//

#import "ViewController.h"
#import "AppModel.h"
#import "NetWorkTool.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *ListTab;

/**
 
 */
@property(nonatomic,strong)NSArray<AppModel*>* iconModelList;
@end
static NSString* CellID = @"iconCellID";
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    __weak typeof(self)weakSelf = self;
    [AppModel appModelRequestWithUrlString:@"https://raw.githubusercontent.com/HuKun1987/AsynToLoad/master/apps.json" Param:nil FinishedBlock:^(NSArray<AppModel *> *applist) {
        weakSelf.iconModelList = applist;
        [weakSelf.ListTab reloadData];
    }];
    
    
    [self.ListTab registerClass:[UITableViewCell class] forCellReuseIdentifier:CellID];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.iconModelList.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];

    return cell;
}
-(NSArray<AppModel *> *)iconModelList{
    if (!_iconModelList) {
        _iconModelList = [NSArray array];
    }
    return _iconModelList;
}

@end
