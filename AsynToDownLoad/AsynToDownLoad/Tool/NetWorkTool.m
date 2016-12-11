//
//  NetWorkTool.m
//  AsynToDownLoad
//
//  Created by 胡坤 on 2016/12/11.
//  Copyright © 2016年 hukun. All rights reserved.
//

#import "NetWorkTool.h"

@implementation NetWorkTool

NetWorkTool* _instance;
+(instancetype)sharedTool
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        _instance = [[self alloc]init];

    });
    return _instance;
}

-(void)requestDataWithType:(RequestType)requestType UrlString:(NSString *)urlStr Param:(id)param CompleteBlock:(Complete)finished
{
    
    void (^success)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) = ^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    };

    void (^failure)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) = ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    };
  
    if (requestType == AFNRequestTypeGet)
    {
        [_instance GET:urlStr parameters:param progress:nil success:success failure:failure];
    }else if (requestType == AFNRequestTypePost){
    
        [_instance POST:urlStr parameters:param progress:nil success:success failure:failure];
    }
}

@end
