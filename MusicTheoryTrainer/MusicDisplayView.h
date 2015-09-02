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

@interface MusicDisplayView : NSView
{
    
    NSBezierPath *staff;
    
    //Text Attribute Dictionarys
    NSMutableDictionary *attributes;
    NSMutableDictionary *musicFontAttributes;
    
//    NSView *musicViewWindow;

    
    //Staff Size and Notation Placement Variables

    NSString *musicObject;
    NSPoint clefLocation;
    NSString *flat;
    NSString *sharp;
    
}

@property KeySignature *currentKeySignature;
@property float musicView_x_center;
@property float musicView_y_center;
@property float flatWidth;
@property float sharpWidth;
@property float clefWidth;




- (void)drawStaffWithClef:(int)clef
               staffWidth:(float)width
              staffHeight:(float)height
            musicFontSize:(float)musicFontSize;

@end
