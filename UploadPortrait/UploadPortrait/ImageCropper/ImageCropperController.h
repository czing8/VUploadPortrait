//
//  ImageCropperController.h
//  UploadPortrait
//
//  Created by Vols on 14-8-30.
//  Copyright (c) 2014年 vols. All rights reserved.
//  Block 风格

#import <UIKit/UIKit.h>

typedef void(^ImageCropComplete) (UIImage * image);

@interface ImageCropperController : UIViewController

@property (nonatomic, copy) ImageCropComplete imageCropComplete;
@property (nonatomic, assign) CGRect cropFrame;
@property (nonatomic, assign) NSInteger tag;

- (id)initWithImage:(UIImage *)originalImage cropFrame:(CGRect)cropFrame limitScaleRatio:(NSInteger)limitRatio;

@end
