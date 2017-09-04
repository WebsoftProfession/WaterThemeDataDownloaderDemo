//
//  ViewController.m
//  WaterThemeDataDownloaderDemo
//
//  Created by  on 6/24/16.
//  Copyright © 2016 .
//

#import "ViewController.h"

#import "UIImageView+WebCache.h"

@interface ViewController ()
{
    NSTimer *timer;
    CGPoint startPoint;
    CGPoint endPoint;
    CGPoint controlPoint1;
    CGPoint controlPoint2;
    
    float drawRate1;
    float drawRate2;
    
    CGRect defaultViewFrame;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    circleView.layer.cornerRadius= circleView.frame.size.width/2;
    
    defaultViewFrame=themeView.frame;
    
    drawRate1=1.0;
    drawRate2=1.0;
    NSArray *myPathList = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *mainPath    = [myPathList  objectAtIndex:0];
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    NSArray *fileArray = [fileMgr contentsOfDirectoryAtPath:mainPath error:nil];
    for (NSString *filename in fileArray)  {
        [fileMgr removeItemAtPath:[mainPath stringByAppendingPathComponent:filename] error:NULL];
    }
    
    [imgView sd_setImageWithURL:[NSURL URLWithString:@"https://wallpaperbrowse.com/media/images/HD-wallpaper-download-1.jpg"] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
        float rec=(float)receivedSize;
        float exp=(float)expectedSize;
        drawRate1+=1.0;
        drawRate2=(rec/exp)*100;
        
        [themeView drawAnimationWithPointX:drawRate1 withPoint:drawRate2];
        
        [themeView setNeedsDisplay];
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        NSLog(@"downloaded.");
        
    }];
    
    //https://pixabay.com/static/uploads/photo/2015/08/14/08/29/images-888133_960_720.jpg
    
//    startPoint=CGPointMake(CGRectGetMinX(defaultViewFrame), CGRectGetMaxY(defaultViewFrame));
//    endPoint=CGPointMake(CGRectGetMaxX(defaultViewFrame), CGRectGetMaxY(defaultViewFrame));
//    controlPoint1=CGPointMake(defaultViewFrame.size.width/2, defaultViewFrame.size.height/2);
//    controlPoint2=CGPointMake(defaultViewFrame.size.width/2, defaultViewFrame.size.height/2);
    
    themeView.layer.cornerRadius=themeView.frame.size.width/2;
    themeView.alpha=0.5;
    containerView.layer.cornerRadius=containerView.frame.size.width/2;
    containerView.layer.borderColor=[UIColor blackColor].CGColor;
    containerView.layer.borderWidth=1.0;
    
    
    
    
    //timer=[NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(doAnimation:) userInfo:nil repeats: YES];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)doAnimation:(NSTimer *)infoObject
{
    drawRate1+=1.0;
    drawRate2+=1;
    
    controlPoint1=CGPointMake(CGRectGetMinX(defaultViewFrame), CGRectGetMaxY(defaultViewFrame)-drawRate1);
    controlPoint2=CGPointMake(CGRectGetMinX(defaultViewFrame), CGRectGetMaxY(defaultViewFrame)-drawRate2);
    
    //[themeView drawAnimationWithStartPoint:startPoint withControlPoint1: controlPoint1 withControlPoint2:controlPoint2 withEndPoint:endPoint withLessRateX:drawRate1 withLessRateY:drawRate2];
    [themeView drawAnimationWithPointX:drawRate1 withPoint:drawRate2];
    
    [themeView setNeedsDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
