//
//  Staff.h
//  MusicTheoryTrainer
//
//  Created by Jess Hendricks on 9/3/15.
//  Copyright (c) 2015 Jess Hendricks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Staff : NSObject

@property float topLine;
@property float secondLine;
@property float thirdLine;
@property float fourthLine;
@property float bottomLine;

@property float topSpace;
@property float firstSpace;
@property float secondSpace;
@property float thirdSpace;
@property float fourthSpace;
@property float bottomSpace;

@property float afterTheClef;


- (id)initWithWidth:(float)width
          staffHeight:(float)height
        view_x_Center:(float)view_x_Center
        view_y_Center:(float)view_y_Center
            clefWidth:(float)cWidth;

@end
