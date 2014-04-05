//
//  JHKeySignature.h
//  MusicTheory
//
//  Created by Jess Hendricks on 3/11/14.
//  Copyright (c) 2014 Jess Hendricks. All rights reserved.
//

#import "AppDelegate.h"
#import "JHMusicConstants.h"

@interface JHKeySignature : NSObject


@property int currentClef;

@property NSString *keyString;
@property NSPoint firstAccidental;
@property NSPoint secondAccidental;
@property NSPoint thirdAccidental;
@property NSPoint fourthAccidental;
@property NSPoint fifthAccidental;
@property NSPoint sixthAccidental;
@property NSPoint seventhAccidental;
@property BOOL isSharpKey;
@property int numberOfAccidentals;

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

@property float flatWidth;
@property float sharpWidth;
@property float clefWidth;

+ (id)sharedKeySignature;

- (void)setLineAndStaffWithStaffWidth:(float)width
                          staffHeight:(float)height
                        view_x_Center:(float)view_x_Center
                        view_y_Center:(float)view_y_Center
                            flatWidth:(float)fWidth
                           sharpWidth:(float)sWidth
                            clefWidth:(float)cWidth;

- (void)setNewKeySignature:(NSString *)newKeySignature;

@end
