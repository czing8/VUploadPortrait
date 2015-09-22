//
//  UpdateImageView.h
//  UploadPortrait
//
//  Created by Vols on 14-8-29.
//  Copyright (c) 2014年 vols. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^didSelectedWithImage)(UIImage *image);
typedef void (^didReturnImageURL)(NSString *urlString);

@interface UploadImageView : UIView

@property (retain, nonatomic) UIViewController *parent;
@property (copy, nonatomic) didReturnImageURL resultImageURL;
@property (copy, nonatomic) didSelectedWithImage selectedImage;

- (void)doTap;

@end
