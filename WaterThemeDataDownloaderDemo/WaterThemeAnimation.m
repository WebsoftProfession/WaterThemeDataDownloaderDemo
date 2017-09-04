//
//  WaterThemeAnimation.m
//  WaterThemeDataDownloaderDemo
//
//  Created by  on 6/24/16.
//  Copyright © 2016 .
//

#import "WaterThemeAnimation.h"

@implementation WaterThemeAnimation

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */


- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    i++;
    UIBezierPath *arcPath=[UIBezierPath bezierPath];
    UIBezierPath *arcPath2=[UIBezierPath bezierPath];
    UIBezierPath *arcPath3=[UIBezierPath bezierPath];
    UIBezierPath *arcPath4=[UIBezierPath bezierPath];
    UIBezierPath *arcPath5=[UIBezierPath bezierPath];
    
    [arcPath2 moveToPoint:CGPointMake(CGRectGetMinX(rect), CGRectGetMaxY(rect)-lessRateY)];
    [arcPath3 moveToPoint:CGPointMake(CGRectGetMinX(rect), CGRectGetMaxY(rect)-lessRateY)];
    [arcPath4 moveToPoint:CGPointMake(CGRectGetMinX(rect), CGRectGetMaxY(rect)-lessRateY)];
    [arcPath5 moveToPoint:CGPointMake(CGRectGetMinX(rect), CGRectGetMaxY(rect)-lessRateY)];
    //[arcPath2 addCurveToPoint:endPoint controlPoint1: controlPoint1 controlPoint2:controlPoint2];
    
    if (isLeft) {
        
        [arcPath2 addQuadCurveToPoint:CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect)-lessRateY) controlPoint:CGPointMake(CGRectGetMidX(rect)+lessRateX, CGRectGetMidY(rect)+60-lessRateY)];
        
        
        [arcPath3 addQuadCurveToPoint:CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect)-lessRateY) controlPoint:CGPointMake(CGRectGetMidX(rect)+lessRateX, CGRectGetMidY(rect)+90-lessRateY)];
        [arcPath4 addQuadCurveToPoint:CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect)-lessRateY) controlPoint:CGPointMake(CGRectGetMidX(rect)+lessRateX, CGRectGetMidY(rect)+90-lessRateY)];
        [arcPath5 addQuadCurveToPoint:CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect)-lessRateY) controlPoint:CGPointMake(CGRectGetMidX(rect)+lessRateX, CGRectGetMidY(rect)+90-lessRateY)];
        
        isLeft=NO;
    }
    else
    {
        [arcPath2 addQuadCurveToPoint:CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect)-lessRateY) controlPoint:CGPointMake(CGRectGetMidX(rect)-lessRateX, CGRectGetMidY(rect)+60-lessRateY)];
        
        [arcPath3 addQuadCurveToPoint:CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect)-lessRateY) controlPoint:CGPointMake(CGRectGetMidX(rect)-lessRateX, CGRectGetMidY(rect)+90-lessRateY)];
        [arcPath4 addQuadCurveToPoint:CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect)-lessRateY) controlPoint:CGPointMake(CGRectGetMidX(rect)-lessRateX, CGRectGetMidY(rect)+90-lessRateY)];
        [arcPath5 addQuadCurveToPoint:CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect)-lessRateY) controlPoint:CGPointMake(CGRectGetMidX(rect)-lessRateX, CGRectGetMidY(rect)+90-lessRateY)];
        
        isLeft=YES;
    }
    
    
    
    [arcPath3 setLineWidth:5];
    [[UIColor redColor] setStroke];
    [[UIColor colorWithRed:200.f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:1.0] setStroke];
    [arcPath3  stroke];
    [[UIColor redColor] setStroke];
    //[[UIColor colorWithRed:200.f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:1.0] setStroke];
    [arcPath4  stroke];
    [[UIColor redColor] setStroke];
    //[[UIColor colorWithRed:200.f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:1.0] setStroke];
    [arcPath5  stroke];
    
    
    [arcPath2 setLineWidth:2];
    [[UIColor redColor] setFill];
    //[[UIColor colorWithRed:200.0f/255 green:0.0f/255 blue:0.0f/255 alpha:1.0f] setStroke];
    [arcPath2  fill];
    
    [arcPath moveToPoint:CGPointMake(CGRectGetMinX(rect), CGRectGetMaxY(rect)-lessRateY)];
    
    [arcPath addQuadCurveToPoint:CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect)-lessRateY) controlPoint:CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect)+lessRateY*i+100)];
    [arcPath setLineWidth:2];
    [[UIColor redColor] setFill];
    [arcPath fill];
    
    
    
    
}

-(void)drawAnimationWithPointX:(float)pointX withPoint:(float)pointY
{
    lessRateX=pointX;
    lessRateY=pointY;
}

-( void)drawAnimationWithStartPoint:(CGPoint)start withControlPoint1:( CGPoint)p1 withControlPoint2:(CGPoint)p2 withEndPoint:( CGPoint)end  withLessRateX:(float)lessX  withLessRateY:(float)lessY
{
    //i=2;
//    startPoint=start;
//    endPoint=end;
//    controlPoint1=p1;
//    controlPoint2=p2;
    
    lessRateX=lessX;
    lessRateY=lessY;
    
}


@end
