//
//  JHMusicView.h
//  KeySignatureQuiz
//
//  Created by Fupduck Central MBP on 1/15/14.
//  Copyright (c) 2014 Jess Hendricks. All rights reserved.
//

#import <Cocoa/Cocoa.h>
//#import "JHMusicConstants.h"
#import "KeySignature.h"

@class Staff;

@interface MusicDisplayView : NSView
{
    
    NSBezierPath *staffBezierPath;
    Staff *currentStaff;
    //Text Attribute Dictionarys
//    NSMutableDictionary *textFontAttributes;
//    NSMutableDictionary *musicFontAttributes;
    
//    NSView *musicViewWindow;

    
    //Staff Size and Notation Placement Variables

    NSString *musicObject;
    NSString *flat;
    NSString *sharp;
//    float staffHeight;
}

@property KeySignature *currentKeySignature;
@property float musicView_x_center;
@property float musicView_y_center;
@property float flatWidth;
@property float sharpWidth;
@property float clefWidth;




- (void)drawStaffWithClef:(int)clef
                    staff:(Staff*)newStaff;

@end
