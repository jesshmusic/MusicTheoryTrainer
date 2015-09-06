//
//  JHMusicView.m
//  KeySignatureQuiz
//
//  Created by Fupduck Central MBP on 1/15/14.
//  Copyright (c) 2014 Jess Hendricks. All rights reserved.
//

#import "MusicDisplayView.h"
#import "Staff.h"
#import <math.h>


@implementation MusicDisplayView
@synthesize currentKeySignature;

- (void)setupMusicObjects
{
    flat = [NSString stringWithFormat:@"%C", FLAT_SIGN];
    sharp = [NSString stringWithFormat:@"%C", SHARP_SIGN];
}

- (void)drawKeySignatureWithNumberAccidentals:(int)numberAccidentals
                                   isSharpKey:(BOOL)isSharpKey
{
    
    if (isSharpKey) {
        if (numberAccidentals >= 1) {
            [sharp drawAtPoint:currentStaff.firstAccidental withAttributes:currentStaff.musicFontAttributes];
        }
        if (numberAccidentals >= 2) {
            [sharp drawAtPoint:currentStaff.secondAccidental withAttributes:currentStaff.musicFontAttributes];
        }
        if (numberAccidentals >= 3) {
            [sharp drawAtPoint:currentStaff.thirdAccidental withAttributes:currentStaff.musicFontAttributes];
        }
        if (numberAccidentals >= 4) {
            [sharp drawAtPoint:currentStaff.fourthAccidental withAttributes:currentStaff.musicFontAttributes];
        }
        if (numberAccidentals >= 5) {
            [sharp drawAtPoint:currentStaff.fifthAccidental withAttributes:currentStaff.musicFontAttributes];
        }
        if (numberAccidentals >= 6) {
            [sharp drawAtPoint:currentStaff.sixthAccidental withAttributes:currentStaff.musicFontAttributes];
        }
        if (numberAccidentals == 7) {
            [sharp drawAtPoint:currentStaff.seventhAccidental withAttributes:currentStaff.musicFontAttributes];
        }
    } else {
        if (numberAccidentals >= 1) {
            [flat drawAtPoint:currentStaff.firstAccidental withAttributes:currentStaff.musicFontAttributes];
        }
        if (numberAccidentals >= 2) {
            [flat drawAtPoint:currentStaff.secondAccidental withAttributes:currentStaff.musicFontAttributes];
        }
        if (numberAccidentals >= 3) {
            [flat drawAtPoint:currentStaff.thirdAccidental withAttributes:currentStaff.musicFontAttributes];
        }
        if (numberAccidentals >= 4) {
            [flat drawAtPoint:currentStaff.fourthAccidental withAttributes:currentStaff.musicFontAttributes];
        }
        if (numberAccidentals >= 5) {
            [flat drawAtPoint:currentStaff.fifthAccidental withAttributes:currentStaff.musicFontAttributes];
        }
        if (numberAccidentals >= 6) {
            [flat drawAtPoint:currentStaff.sixthAccidental withAttributes:currentStaff.musicFontAttributes];
        }
        if (numberAccidentals == 7) {
            [flat drawAtPoint:currentStaff.seventhAccidental withAttributes:currentStaff.musicFontAttributes];
        }
        
    }
    
}


#pragma mark Drawing Methods

- (void)drawStaffWithClef:(int)clef
                    staff:(Staff*)newStaff
{
    currentStaff = newStaff;
    
    [self drawClefWithClef:clef];
    
    float lineWidthAmount = 1.5;
    staffBezierPath = [NSBezierPath bezierPath];
    [staffBezierPath setLineWidth:lineWidthAmount];
    [staffBezierPath moveToPoint:NSMakePoint(currentStaff.xStart, currentStaff.yStart)];
    
    //  Actual Staff
    [self drawStaffLineWithXStart:currentStaff.xStart
                             xEnd:currentStaff.xStart + currentStaff.width
                           yPoint:currentStaff.yStart + currentStaff.height];
    
    [self drawStaffLineWithXStart:currentStaff.xStart
                             xEnd:currentStaff.xStart + currentStaff.width
                           yPoint:currentStaff.yStart + (currentStaff.height * .75)];
    
    [self drawStaffLineWithXStart:currentStaff.xStart
                             xEnd:currentStaff.xStart + currentStaff.width
                           yPoint:currentStaff.yStart + (currentStaff.height * .5)];
    
    [self drawStaffLineWithXStart:currentStaff.xStart
                             xEnd:currentStaff.xStart + currentStaff.width
                           yPoint:currentStaff.yStart + (currentStaff.height * .25)];
    
    [self drawStaffLineWithXStart:currentStaff.xStart
                             xEnd:currentStaff.xStart + currentStaff.width
                           yPoint:currentStaff.yStart];
    //  END Actual Staff
    
    [staffBezierPath setLineJoinStyle:NSBevelLineJoinStyle];
    [staffBezierPath setLineCapStyle:NSRoundLineCapStyle];
    [self setNeedsDisplay:true];
}

- (void)drawStaffLineWithXStart:(float)xStart xEnd:(float)xEnd yPoint:(float)yPoint
{
    [staffBezierPath moveToPoint:NSMakePoint(xStart, yPoint)];
    [staffBezierPath lineToPoint:NSMakePoint(xEnd, yPoint)];
}

- (void)drawClefWithClef:(int)clefNumber
{
    switch (clefNumber) {
        case 2:
            musicObject = [NSString stringWithFormat:@"%C", BASS_CLEF];
            break;
        case 3:
            musicObject = [NSString stringWithFormat:@"%C", ALTO_CLEF];
            break;
        case 4:
            musicObject = [NSString stringWithFormat:@"%C", TENOR_CLEF];
            break;
        default:
            musicObject = [NSString stringWithFormat:@"%C", TREBLE_CLEF];
            break;
    }
}

- (void)mouseDown:(NSEvent *)theEvent
{
    NSPoint locationOfMouse = [self convertPoint:[theEvent locationInWindow] fromView:nil];
    float xLoc = locationOfMouse.x;
    float yLoc = locationOfMouse.y;
    NSLog(@"Mouse location, %ld, at x: %f and y: %f", (long)[theEvent clickCount], xLoc, yLoc);
}


- (void)drawRect:(NSRect)dirtyRect
{
	[super drawRect:dirtyRect];
	
    // Drawing code here.
    NSRect bounds = [self bounds];
    [[NSColor whiteColor] set];
    [NSBezierPath fillRect:bounds];
    
    [[NSColor blackColor] set];
    //[self setKey];
    [musicObject drawAtPoint:currentStaff.clefLocation withAttributes:currentStaff.musicFontAttributes];
    KeySignature *keySignature = [KeySignature sharedKeySignature];
    [self drawKeySignatureWithNumberAccidentals:keySignature.numberOfAccidentals
                                     isSharpKey:keySignature.isSharpKey];
    [staffBezierPath stroke];
}

@end
