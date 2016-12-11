//
//  AppModel.h
//  AsynToDownLoad
//
//  Created by 胡坤 on 2016/12/11.
//  Copyright © 2016年 hukun. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AppModel;
typedef void(^Finished)(NSArray<AppModel*>* applist);
@interface AppModel : NSObject
/**
 
 */
@property(copy,nonatomic)NSString* icon;
/**
 
 */
@property(copy,nonatomic)NSString* name;
/**
 
 */
@property(copy,nonatomic)NSString* download;


+(instancetype)appModelWithDic:(NSDictionary*)dic;

+(void)appModelRequestWithUrlString:(NSString*)urlString Param:(id)para FinishedBlock:(Finished)finished;
@end
