//
//  TextureAdapter.m
//  project_j4
//
//  Created by mac zdszkj on 16/2/18.
//  Copyright © 2016年 Zhongdong Digital Technology Co., Ltd. All rights reserved.
//

#import "TextureAdapter.h"
#import "MesherModel.h"
#import "Product.h"

@interface TextureViewHolder : CCVViewHolder {
    id<IMesherModel> mModel;
    CCVRelativeLayout *view;
    UIImageView *img_image;
    CCVImageOptions *opt_img_image;
    CCVRelativeLayout *lo_selected;
}

- (id) initWithModel:(id<IMesherModel>)model;

@end

@implementation TextureViewHolder

- (id)initWithModel:(id<IMesherModel>)model {
    self = [super init];
    if (self != nil) {
        mModel = model;
    }
    return self;
}

- (UIView *)onCreateView:(NSBundle *)bundle viewType:(NSUInteger)viewType parent:(UIView *)parent {
    view = [CCVRelativeLayout layout];
    view.layoutParams.width = [MesherModel uiWidthBy:160.0f];
    view.layoutParams.height = view.layoutParams.width;
    view.backgroundColor = [UIColor clearColor];
    
    img_image = [[UIImageView alloc] init];
    img_image.layoutParams.width = [MesherModel uiWidthBy:140.0f];
    img_image.layoutParams.height = img_image.layoutParams.width;
    img_image.layoutParams.alignment = CCVLayoutAlignCenterInParent;
    [view addSubview:img_image];
    opt_img_image = nil;
    
    lo_selected = [CCVRelativeLayout layout];
    lo_selected.layoutParams.width = [MesherModel uiWidthBy:143.0f];
    lo_selected.layoutParams.height = [MesherModel uiWidthBy:143.0f];
    lo_selected.backgroundColor = [UIColor clearColor];
    lo_selected.layoutParams.alignment = CCVLayoutAlignCenterInParent;
    [view addSubview:lo_selected];
    lo_selected.hidden = YES;
    
    CCVRelativeLayout *lo_top = [CCVRelativeLayout layout];
    lo_top.layoutParams.width = CCVLayoutMatchParent;
    lo_top.layoutParams.height = 3;
    lo_top.layoutParams.alignment = CCVLayoutAlignParentTop;
    lo_top.backgroundColor = [UIColor colorWithARGB:R_color_option_line];
    [lo_selected addSubview:lo_top];
    
    CCVRelativeLayout *lo_left = [CCVRelativeLayout layout];
    lo_left.layoutParams.width = 3;
    lo_left.layoutParams.height = CCVLayoutMatchParent;
    lo_left.layoutParams.alignment = CCVLayoutAlignParentLeft;
    lo_left.backgroundColor = [UIColor colorWithARGB:R_color_option_line];
    [lo_selected addSubview:lo_left];
    
    CCVRelativeLayout *lo_bottom = [CCVRelativeLayout layout];
    lo_bottom.layoutParams.width = CCVLayoutMatchParent;
    lo_bottom.layoutParams.height = 3;
    lo_bottom.layoutParams.alignment = CCVLayoutAlignParentBottom;
    lo_bottom.backgroundColor = [UIColor colorWithARGB:R_color_option_line];
    [lo_selected addSubview:lo_bottom];
    
    CCVRelativeLayout *lo_right = [CCVRelativeLayout layout];
    lo_right.layoutParams.width = 3;
    lo_right.layoutParams.height = CCVLayoutMatchParent;
    lo_right.layoutParams.alignment = CCVLayoutAlignParentRight;
    lo_right.backgroundColor = [UIColor colorWithARGB:R_color_option_line];
    [lo_selected addSubview:lo_right];
    
    return view;
}

- (void)setRecord:(id)record {
    Source *source = record;
    img_image.image = nil;
    if(!source.preview.exists) {
        source.preview.extension = @"pvr";
    }
    [[CCVCorePluginSystem instance].imageCache getBy:source.preview options:nil async:YES onGet:^(UIImage *image) {
        img_image.image = image;
    }];
}

//- (void)onSelected:(BOOL)selected {
//    if (selected) {
//        lo_selected.hidden = NO;
//    }else {
//        lo_selected.hidden = YES;
//    }
//}

@end

@implementation TextureAdapter

- (id<ICVViewHolder>)onCreateViewHolder {
    return [[TextureViewHolder alloc] init];
}

- (CGSize)getViewSizeAt:(NSUInteger)position {
    CGSize size = CGSizeMake([MesherModel uiWidthBy:160.0f], [MesherModel uiWidthBy:160.0f]);
    return size;
}

@end
