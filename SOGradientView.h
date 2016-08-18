//
//  SOGradientView.h
//  souban
//
//  Created by Rawlings on 6/14/16.
//  Copyright © 2016 wajiang. All rights reserved.
//

/*
 Usage:
 
 SOGradientView *gradientCover = [[SOGradientView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 51)];
 gradientCover.backgroundColor = [UIColor clearColor];
 gradientCover.vector = CGPointMake(0, 1);
 gradientCover.locations = @[@(0.01), @(0.8), @(0.8)];
 UIColor *color1 = SSGrayColor(236);
 UIColor *color2 = SSColorA(255, 255, 255, 0);
 UIColor *color3 = SSColorA(255, 255, 255, 0);
 gradientCover.colors = @[(__bridge id)color1.CGColor, (__bridge id)color2.CGColor, (__bridge id)color3.CGColor];
 */


#import <UIKit/UIKit.h>

@interface SOGradientView : UIView
@property (nonatomic, assign) CGPoint vector;/**< 渐变方向 */
@property (nonatomic, strong) NSArray *locations;/**<  */
@property (nonatomic, strong) NSArray *colors;/**<  */
@end
