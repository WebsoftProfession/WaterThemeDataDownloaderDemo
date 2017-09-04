//
//  ViewController.h
//  WaterThemeDataDownloaderDemo
//
//  Created by  on 6/24/16.
//  Copyright © 2016 .
//

#import <UIKit/UIKit.h>
#import "WaterThemeAnimation.h"
#import "CircleView.h"

@interface ViewController : UIViewController
{
    
    __weak IBOutlet WaterThemeAnimation *themeView;
    __weak IBOutlet UIView *containerView;
    __weak IBOutlet UIImageView *imgView;
    __weak IBOutlet CircleView *circleView;
}

@end

