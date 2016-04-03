//
//  PImageView.m
//  GetColor
//
//  Created by lpc on 16/4/4.
//  Copyright © 2016年 lpc. All rights reserved.
//

#import "PImageView.h"
#import "UIImage+ColorAtPixel.h"

@implementation PImageView
{
    ColorBlock block_;
}

- (void)colorWithPoint:(CGPoint)point
{
    UIImage *image = self.image;
    CGSize iSize = image.size;
    CGSize bSize = self.bounds.size;
    point.x *= (bSize.width != 0) ? (iSize.width / bSize.width) : 1;
    point.y *= (bSize.height != 0) ? (iSize.height / bSize.height) : 1;

    UIColor *color = [image colorAtPixel:point];

    if (block_) {
        block_(color);
    }
}

- (void)setColorBlock:(ColorBlock)block{
    block_ = [block copy];
}


#pragma mark -- Touches Events --
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    [self colorWithPoint:point];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    [self colorWithPoint:point];
}

@end
