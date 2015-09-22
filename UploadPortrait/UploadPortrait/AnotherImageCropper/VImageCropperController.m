//
//  VImageCropperController.m
//  UploadPortrait
//
//  Created by Vols on 14-8-30.
//  Copyright (c) 2014年 vols. All rights reserved.
//

#import "VImageCropperController.h"

#define kSCREEN_SIZE  [UIScreen mainScreen].bounds.size

@interface VImageCropperController ()

@property (nonatomic, strong) BJImageCropper *imageCropperView;

@property (nonatomic, strong) UIImage * originalImage;
@property (nonatomic, strong) UIImage *editedImage;

@end

@implementation VImageCropperController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithImage:(UIImage *)originalImage{
    self = [super init];
    if (self) {
        self.originalImage = originalImage;
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];

    [self initView];
}

- (void)initView{
    [self.view addSubview:self.imageCropperView];
    
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc] initWithTitle:@"OK" style:UIBarButtonItemStylePlain target:self action:@selector(clickRight)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

#pragma mark - properties
- (BJImageCropper *)imageCropperView{
    if (!_imageCropperView) {
        _imageCropperView = [[BJImageCropper alloc] initWithImage:self.originalImage andMaxSize:CGSizeMake(kSCREEN_SIZE.width, kSCREEN_SIZE.height-64)];
        _imageCropperView.backgroundColor = [UIColor orangeColor];
        _imageCropperView.frame = CGRectMake(0, 64, 320, kSCREEN_SIZE.height-64);
        
        _imageCropperView.imageView.layer.shadowColor = [[UIColor blackColor] CGColor];
        _imageCropperView.imageView.layer.shadowRadius = 3.0f;
        _imageCropperView.imageView.layer.shadowOpacity = 0.8f;
        
        _imageCropperView.imageView.center = CGPointMake(kSCREEN_SIZE.width/2, (kSCREEN_SIZE.height-64)/2);
    }
    return _imageCropperView;
}

- (void)clickRight
{
    UIImage *image = self.imageCropperView.getCroppedImage;
    self.completion(image);
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma helper

//创建Button的模板
- (UIButton*)buildButton:(CGRect)frame
            normalImgStr:(NSString*)normalImgStr
         highlightImgStr:(NSString*)highlightImgStr
          selectedImgStr:(NSString*)selectedImgStr
                  action:(SEL)action
{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    
    if (normalImgStr.length > 0) {
        [btn setImage:[UIImage imageNamed:normalImgStr] forState:UIControlStateNormal];
    }
    if (highlightImgStr.length > 0) {
        [btn setImage:[UIImage imageNamed:highlightImgStr] forState:UIControlStateHighlighted];
    }
    if (selectedImgStr.length > 0) {
        [btn setImage:[UIImage imageNamed:selectedImgStr] forState:UIControlStateSelected];
    }
    
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
