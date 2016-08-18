//
//  SOGradientView.m
//  souban
//
//  Created by Rawlings on 6/14/16.
//  Copyright © 2016 wajiang. All rights reserved.
//

#import "SOGradientView.h"
#import "UIColor+OM.h"

@interface SOGradientView ()
@property (nonatomic, strong) CAGradientLayer *gradient;/**<  */
@end
@implementation SOGradientView

// ***********************************************************************************
#pragma mark - Lifecycle
// ***********************************************************************************
- (void)awakeFromNib{
    [super awakeFromNib];
    [self configGradient];
}

- (instancetype)init{
    if (self = [super init]) {
        [self configGradient];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self configGradient];
    }
    return self;
}

- (void)layoutSublayersOfLayer:(CALayer *)layer{
    [super layoutSublayersOfLayer:layer];
    self.gradient.frame = self.bounds;
}

// ***********************************************************************************
#pragma mark - Private
// ***********************************************************************************
- (void)configGradient{
    self.backgroundColor = [UIColor clearColor];
    [self.layer addSublayer:self.gradient];
    
    UIColor *color1 = SSColor(194, 194, 194);
    UIColor *color2 = SSColorA(150, 150, 150, 0);
    
    self.gradient.startPoint = CGPointMake(0, 0);
    self.gradient.endPoint = CGPointMake(1, 0);
    self.gradient.colors = @[(__bridge id)color1.CGColor, (__bridge id)color2.CGColor];
    self.gradient.locations = @[@(0.5)];
}

- (CGPoint)convertPoint:(CGPoint)point{
    if (point.x > point.y) {
        CGFloat y = point.y / point.x;
        return CGPointMake(1, y);
    }else{
        CGFloat x = point.x / point.y;
        return CGPointMake(x, 1);
    }
}

// ***********************************************************************************
#pragma mark - Setter / Getter
// ***********************************************************************************
- (void)setLocations:(NSArray *)locations{
    _locations = locations;
    _gradient.locations = locations;
}

- (void)setColors:(NSArray *)colors{
    _colors = colors;
    if (colors.count) {
        if ([colors[0] isKindOfClass:[UIColor class]]) {
            NSMutableArray *mArr = @[].mutableCopy;
            for (UIColor *color in colors) {
                id cg = (__bridge id)color.CGColor;
                [mArr addObject:cg];
            }
            _gradient.colors = mArr;
            return;
        }
    }
    _gradient.colors = colors;
}

- (void)setVector:(CGPoint)vector{
    _vector = vector;
    _gradient.endPoint = [self convertPoint:vector];
}

- (CAGradientLayer *)gradient{
    if (!_gradient) {
        _gradient = [CAGradientLayer layer];
    }
    return _gradient;
}



@end
