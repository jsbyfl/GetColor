//
//  PImageView.h
//  GetColor
//
//  Created by lpc on 16/4/4.
//  Copyright © 2016年 lpc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ColorBlock)(UIColor *color);

@interface PImageView : UIImageView

- (void)setColorBlock:(ColorBlock)block;

@end
