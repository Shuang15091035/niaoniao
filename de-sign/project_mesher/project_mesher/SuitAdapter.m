//
//  SuitAdapter.m
//  project_mesher
//
//  Created by mac zdszkj on 15/12/1.
//  Copyright © 2015年 Zhongdong Digital Technology Co., Ltd. All rights reserved.
//

#import "SuitAdapter.h"
#import "MesherModel.h"

@interface SuitViewHolder : JWViewHolder {
    
    JWRelativeLayout *lo_view;
    UIImageView* img_image;
    JWImageOptions* opt_img_image;
    UILabel *name;
}

@end

@implementation SuitViewHolder

- (UIView *)onCreateView:(NSBundle *)bundle viewType:(NSUInteger)viewType parent:(UIView *)parent {
    lo_view = [JWRelativeLayout layout];
    lo_view.layoutParams.width = [MesherModel uiWidthBy:580.0f];
    lo_view.layoutParams.height = [MesherModel uiHeightBy:560.0f];
    lo_view.backgroundColor = [UIColor clearColor];
    
    UIImage *bg_suit_adapter = [UIImage imageByResourceDrawable:@"bg_suit_adapter"];
    UIImageView *bg_suit = [[UIImageView alloc] initWithImage:bg_suit_adapter];
    bg_suit.layoutParams.width = [MesherModel uiWidthBy:520.0f];
    bg_suit.layoutParams.height = [MesherModel uiHeightBy:380.0f];
    bg_suit.layoutParams.alignment = JWLayoutAlignParentTopLeft;
    bg_suit.layoutParams.marginLeft = [MesherModel uiWidthBy:30.0f];
    bg_suit.layoutParams.marginTop = [MesherModel uiHeightBy:60.0f];
    [lo_view addSubview:bg_suit];
    
    JWRelativeLayout *lo_image = [JWRelativeLayout layout];
    lo_image.layoutParams.width = [MesherModel uiWidthBy:520.0f];
    lo_image.layoutParams.height = [MesherModel uiHeightBy:380.0f];
    lo_image.layoutParams.alignment = JWLayoutAlignParentTopLeft;
    lo_image.layoutParams.marginLeft = [MesherModel uiWidthBy:30.0f];
    lo_image.layoutParams.marginTop = [MesherModel uiHeightBy:60.0f];
    [lo_view addSubview:lo_image];
    
    img_image = [[UIImageView alloc] init];
    float size = [MesherModel uiWidthBy:520.0f] < [MesherModel uiHeightBy:380.0f] ? [MesherModel uiWidthBy:520.0f] : [MesherModel uiHeightBy:380.0f];
    img_image.layoutParams.width = size;
    img_image.layoutParams.height = size;
    img_image.contentMode = UIViewContentModeScaleAspectFill;
    img_image.layoutParams.alignment = JWLayoutAlignCenterInParent;
    img_image.layoutParams.marginTop = 6;
    img_image.layoutParams.marginLeft = 6;
    img_image.layoutParams.marginBottom = 6;
    img_image.layoutParams.marginRight = 6;
    [lo_image addSubview:img_image];
    opt_img_image = nil;
    
    name = [[UILabel alloc] init];
    name.layoutParams.width = [MesherModel uiWidthBy:520.0f];
    name.layoutParams.height = JWLayoutWrapContent;
    name.layoutParams.alignment = JWLayoutAlignCenterHorizontal;
    name.layoutParams.below = lo_image;
    name.layoutParams.marginTop = [MesherModel uiHeightBy:30.0f];
    name.textAlignment = NSTextAlignmentCenter;
    name.textColor = [UIColor whiteColor];
    if ([UIDevice currentDevice].type == UIDeviceTypeIPad){
        name.labelTextSize = 20;
    }else if([UIDevice currentDevice].type == UIDeviceTypeIPhone){
        name.labelTextSize = 13;
    }
    [lo_view addSubview:name];
    
    return lo_view;
}

- (void)setRecord:(id)record {
    Plan *plan = record;
    img_image.image = nil;
    if (plan.preview != nil) {
        [[JWCorePluginSystem instance].imageCache getBy:plan.preview options:opt_img_image async:YES onGet:^(UIImage *image) {
            img_image.image = image;
        }];
    };
    name.text = plan.name;
}

@end

@implementation SuitAdapter

- (id<JIViewHolder>)onCreateViewHolder {
    return [[SuitViewHolder alloc] init];
}

- (CGSize)getViewSizeAt:(NSUInteger)position {
    CGSize size = CGSizeMake([MesherModel uiWidthBy:580.0f], [MesherModel uiHeightBy:560.0f]);
    return size;
}

@end
