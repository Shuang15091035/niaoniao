//
//  ArchCameraBehaviour.m
//  project_mesher
//
//  Created by mac zdszkj on 16/1/28.
//  Copyright © 2016年 Zhongdong Digital Technology Co., Ltd. All rights reserved.
//

#import "ArchCameraBehaviour.h"

@interface ArchCameraBehaviour() {
    id<ICVStateMachine> mMachine;
}

@end

@implementation ArchCameraBehaviour

@synthesize machine = mMachine;


- (BOOL)onScreenTouchUp:(NSSet *)touches withEvent:(UIEvent *)event {
    return YES;
}

//- (void)onSingleTap:(UITapGestureRecognizer *)singleTap {
//    //[mMachine changeStateTo:[States PlanEdit] pushState:NO];
//    [mMachine revertState];
//}

@end
