//
//  VImageCropperController.h
//  UploadPortrait
//
//  Created by Vols on 14-8-30.
//  Copyright (c) 2014年 vols. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BJImageCropper.h"

typedef void(^ImageCropComplete) (UIImage * image);

@interface VImageCropperController : UIViewController

@property (nonatomic, copy) ImageCropComplete completion;

- (id)initWithImage:(UIImage *)originalImage;

@end
