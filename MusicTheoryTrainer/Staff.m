//
//  Staff.m
//  MusicTheoryTrainer
//
//  Created by Jess Hendricks on 9/3/15.
//  Copyright (c) 2015 Jess Hendricks. All rights reserved.
//

#import "Staff.h"

@implementation Staff
@synthesize topLine, secondLine, thirdLine, fourthLine, bottomLine,
topSpace, firstSpace, secondSpace, thirdSpace, fourthSpace, bottomSpace, afterTheClef;

- (id)initWithWidth:(float)width
          staffHeight:(float)height
        view_x_Center:(float)view_x_Center
        view_y_Center:(float)view_y_Center
            clefWidth:(float)cWidth
{
    float adjustedStaffHeight = height;
    float spaceBetween = adjustedStaffHeight/4;
    float staffBottom = view_y_Center - (adjustedStaffHeight/2);
    adjustedStaffHeight = adjustedStaffHeight + staffBottom;
    afterTheClef = view_x_Center - width/2 + (cWidth + (cWidth * .4));
    
    [self setStaffLines:spaceBetween adjustedStaffHeight:adjustedStaffHeight];
    
    [self setStaffSpaces:spaceBetween];
    return self;
}

- (void)setStaffLines:(float)spaceBetween adjustedStaffHeight:(float)adjustedStaffHeight
{
    topLine = adjustedStaffHeight - (spaceBetween * 8.3);
    secondLine = adjustedStaffHeight - (spaceBetween * 9.3);
    thirdLine = adjustedStaffHeight - (spaceBetween * 10.3);
    fourthLine = adjustedStaffHeight - (spaceBetween * 11.3);
    bottomLine = adjustedStaffHeight - (spaceBetween * 12.3);
}

- (void)setStaffSpaces:(float)spaceBetween
{
    topSpace = topLine + (spaceBetween * .5);
    firstSpace = secondLine + (spaceBetween * .5);
    secondSpace = thirdLine + (spaceBetween * .5);
    thirdSpace = fourthLine + (spaceBetween * .5);
    fourthSpace = bottomLine + (spaceBetween * .5);
    bottomSpace = bottomLine - (spaceBetween * .5);
}

@end
