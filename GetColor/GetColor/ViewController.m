//
//  ViewController.m
//  GetColor
//
//  Created by lpc on 16/4/4.
//  Copyright © 2016年 lpc. All rights reserved.
//

#import "ViewController.h"
#import "PImageView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet PImageView *imgView;
@property (weak, nonatomic) IBOutlet UIView *colorView;

@property (weak, nonatomic) IBOutlet UILabel *hexColorLab;
@property (weak, nonatomic) IBOutlet UILabel *rgbaColorLab;
@property (weak, nonatomic) IBOutlet UILabel *dateLab;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.imgView setColorBlock:^(UIColor *color) {
        [self customWithImageColor:color];
    }];

    self.dateLab.text = [NSString stringWithFormat:@"Release Date: %@",[self buildTime]];
}

- (void)customWithImageColor:(UIColor *)color
{
    self.colorView.backgroundColor = color;
    [self resetWithColor:color];
}

- (void)resetWithColor:(UIColor *)color
{
    CGFloat r, g, b, a;
    [color getRed:&r green:&g blue:&b alpha:&a];
    NSString *colorDescFloat = [NSString stringWithFormat:@"RGBA: %f, %f, %f, %f", r, g, b, a];
    
    int ir = r * 255;
    int ig = g * 255;
    int ib = b * 255;
    int ia = a * 255;
    NSString *hexColor = [NSString stringWithFormat:@"Hex: #%02x%02x%02x", ir, ig, ib];
    NSString *colorDescInt = [NSString stringWithFormat:@"RGBA: %d, %d, %d, %d", ir, ig, ib, ia];

    self.hexColorLab.text = hexColor;
    self.rgbaColorLab.text = colorDescInt;

    NSLog(@"\n%@\n%@\n%@\n\n",hexColor,colorDescFloat,colorDescInt);
}

- (NSString *)buildTime
{
    NSString *date = [NSString stringWithFormat:@"%s",__DATE__];
    NSUInteger length = date.length;
    NSString *year = [date substringFromIndex:length - 4];
    NSString *monthAndDay = [date substringToIndex:length - 5];
    date = [monthAndDay stringByAppendingFormat:@", %@", year];

    NSString *time = [NSString stringWithFormat:@" %s",__TIME__];
//    if (time.length > 6)
//    {
//        time = [time substringToIndex:6];
//    }

    return [date stringByAppendingString:time];
}
@end
