//
//  PlanLoader.m
//  project_mesher
//
//  Created by mac zdszkj on 15/12/8.
//  Copyright © 2015年 Zhongdong Digital Technology Co., Ltd. All rights reserved.
//

#import "PlanLoader.h"

@interface PlanLoader () {
    Plan* mPlan;
}

@end

@implementation PlanLoader

@synthesize plan = mPlan;

- (NSString *)pattern {
    // 正则表达式
    return @"[\\w\\W]*.[pP][lL][aA]";
}

- (id<ICVGameObject>)loadSceneFile:(id<ICVFile>)file parent:(id<ICVGameObject>)parent params:(CCVSceneLoadParams *)params handler:(CCVSceneLoaderEventHandler *)handler cancellable:(id<ICVCancellable>)cancellable {
    if (mPlan == nil) {
        return nil;
    }
    return [mPlan loadSceneFile:file parent:parent params:params handler:handler cancellable:cancellable];
}

@end
