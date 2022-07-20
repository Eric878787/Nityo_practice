//
//  CustomButton.m
//  Nityo_practice
//
//  Created by Eric chung on 2022/7/5.
//

#import "CustomButton.h"

@implementation CustomButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:86/255.0 green:179/255.0 blue:11/255.0 alpha: 1.0];
        [self setTitle:@"加好友" forState: UIControlStateNormal];
        [self setTitleColor: [UIColor colorWithRed: 255/255.0 green: 255/255.0 blue: 255/255.0 alpha: 1.0] forState:UIControlStateNormal];
        [self.titleLabel setFont:[UIFont fontWithName:@"PingFangTC-Medium" size: 16]];
    }
    return self;
}

@end
