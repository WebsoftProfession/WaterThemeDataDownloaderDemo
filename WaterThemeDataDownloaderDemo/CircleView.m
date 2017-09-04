//
//  CircleView.m
//  Core Animation R&D
//
//  Created by  on 5/5/16.
//  Copyright © 2016 .
//

#import "CircleView.h"

@implementation CircleView
{
    float greenCircleValue;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    if (greenCircleValue==0) {
        
    }
    
    float outer_radius = sqrt(rect.size.width*rect.size.width + rect.size.height*rect.size.height)*0.5;
    
    CGPoint center = CGPointMake(self.frame.size.width / 2.0, self.frame.size.height / 2.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextBeginPath(ctx);
    [[UIColor clearColor] set];
     CGContextSetLineWidth(ctx, 6);
    CGContextAddArc(ctx, center.x, center.y, rect.size.width/2-3, 0, 2*M_PI, 0);
    CGContextStrokePath(ctx);
    [[UIColor colorWithRed:76.0/255 green:217.0/255 blue:192.0/255 alpha:1.0] set];
    CGContextSetLineWidth(ctx, 6);
    CGContextAddArc(ctx, center.x, center.y, rect.size.width/2-3, 0, M_PI*2, 0);
    
    CABasicAnimation *drawAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    drawAnimation.duration            = 10.0; // "animate over 10 seconds or so.."
    drawAnimation.repeatCount         = 1.0;  // Animate only once..
    
    // Animate from no part of the stroke being drawn to the entire stroke being drawn
    drawAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    drawAnimation.toValue   = [NSNumber numberWithFloat:1.0f];
    
    // Experiment with timing to get the appearence to look the way you want
    drawAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    // Add the animation to the circle
    [self.layer addAnimation:drawAnimation forKey:@"drawCircleAnimation"];
    
    CGContextStrokePath(ctx);
    
}

-(void)updateGreenCircle:(float)value withMaxValue:(float)maxValue
{
    //greenCircleValue=0.0;
    greenCircleValue=2*value/maxValue;
    
    //[self drawRect:self.bounds];
}




@end
