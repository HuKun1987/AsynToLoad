//
//  AppModel.m
//  AsynToDownLoad
//
//  Created by 胡坤 on 2016/12/11.
//  Copyright © 2016年 hukun. All rights reserved.
//

#import "AppModel.h"
#import "NetWorkTool.h"
@implementation AppModel



+(void)appModelRequestWithUrlString:(NSString *)urlString Param:(id)para FinishedBlock:(Finished)finished
{
    [[NetWorkTool sharedTool]requestDataWithType:AFNRequestTypeGet UrlString:urlString Param:para CompleteBlock:^(id result)
    {
        if ([result isKindOfClass:[NSArray class]])
        {
            NSArray* dataArr = (NSArray*)result;
            
            [dataArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
            {
                NSMutableArray* temp = [NSMutableArray arrayWithCapacity:1];
                
                if ([obj isKindOfClass:[NSDictionary class]])
                {
                    NSDictionary* dic = (NSDictionary*)obj;
                    
                 AppModel* model =  [AppModel appModelWithDic:dic];
                    
                    [temp addObject:model];
                }
                finished(temp.copy);
            }];
        }
    }];
}

+(instancetype)appModelWithDic:(NSDictionary *)dic
{
    AppModel * model = [[AppModel alloc]init];

    [model setValuesForKeysWithDictionary:dic];

    return model;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
//防错处理
}


@end
