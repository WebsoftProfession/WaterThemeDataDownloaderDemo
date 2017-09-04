//
//  WaterThemeAnimation.h
//  WaterThemeDataDownloaderDemo
//
//  Created by  on 6/24/16.
//  Copyright © 2016 .
//

#import <UIKit/UIKit.h>

@interface WaterThemeAnimation : UIView
{
//    float startPoint;
//    float endPoint;
    float lessRateX;
    float lessRateY;
    
    BOOL isLeft;
    int i;
    
    CGPoint startPoint;
    CGPoint endPoint;
    CGPoint controlPoint1;
    CGPoint controlPoint2;
}

-( void)drawAnimationWithStartPoint:(CGPoint)start withControlPoint1:( CGPoint)p1 withControlPoint2:(CGPoint)p2 withEndPoint:( CGPoint)end withLessRateX:(float)lessX  withLessRateY:(float)lessY;

-(void)drawAnimationWithPointX:(float)pointX withPoint:(float)pointY;

@end
