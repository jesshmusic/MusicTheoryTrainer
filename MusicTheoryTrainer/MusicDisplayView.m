//
//  JHMusicView.m
//  KeySignatureQuiz
//
//  Created by Fupduck Central MBP on 1/15/14.
//  Copyright (c) 2014 Jess Hendricks. All rights reserved.
//

#import "MusicDisplayView.h"
#import <math.h>


@implementation MusicDisplayView
@synthesize currentKeySignature;

- (id)initWithFrame:(NSRect)frameRect
{
    if (self = [super initWithFrame:frameRect]) {
        
        [self setMusicView_x_center:frameRect.size.width/2];
        [self setMusicView_y_center:frameRect.size.height/2];
        flat = [NSString stringWithFormat:@"%C", FLAT_SIGN];
        sharp = [NSString stringWithFormat:@"%C", SHARP_SIGN];
        currentKeySignature = [KeySignature sharedKeySignature];
    }
    return self;
}


- (void)drawKeySignatureWithNumberAccidentals:(int)numberAccidentals
                                   isSharpKey:(BOOL)isSharpKey
{
    KeySignature *keySignature = [KeySignature sharedKeySignature];
    if (isSharpKey) {
        if (numberAccidentals >= 1) {
            [sharp drawAtPoint:keySignature.firstAccidental withAttributes:musicFontAttributes];
        }
        if (numberAccidentals >= 2) {
            [sharp drawAtPoint:keySignature.secondAccidental withAttributes:musicFontAttributes];
        }
        if (numberAccidentals >= 3) {
            [sharp drawAtPoint:keySignature.thirdAccidental withAttributes:musicFontAttributes];
        }
        if (numberAccidentals >= 4) {
            [sharp drawAtPoint:keySignature.fourthAccidental withAttributes:musicFontAttributes];
        }
        if (numberAccidentals >= 5) {
            [sharp drawAtPoint:keySignature.fifthAccidental withAttributes:musicFontAttributes];
        }
        if (numberAccidentals >= 6) {
            [sharp drawAtPoint:keySignature.sixthAccidental withAttributes:musicFontAttributes];
        }
        if (numberAccidentals == 7) {
            [sharp drawAtPoint:keySignature.seventhAccidental withAttributes:musicFontAttributes];
        }
    } else {
        if (numberAccidentals >= 1) {
            [flat drawAtPoint:keySignature.firstAccidental withAttributes:musicFontAttributes];
        }
        if (numberAccidentals >= 2) {
            [flat drawAtPoint:keySignature.secondAccidental withAttributes:musicFontAttributes];
        }
        if (numberAccidentals >= 3) {
            [flat drawAtPoint:keySignature.thirdAccidental withAttributes:musicFontAttributes];
        }
        if (numberAccidentals >= 4) {
            [flat drawAtPoint:keySignature.fourthAccidental withAttributes:musicFontAttributes];
        }
        if (numberAccidentals >= 5) {
            [flat drawAtPoint:keySignature.fifthAccidental withAttributes:musicFontAttributes];
        }
        if (numberAccidentals >= 6) {
            [flat drawAtPoint:keySignature.sixthAccidental withAttributes:musicFontAttributes];
        }
        if (numberAccidentals == 7) {
            [flat drawAtPoint:keySignature.seventhAccidental withAttributes:musicFontAttributes];
        }
        
    }
    
}


#pragma mark Drawing Methods

- (void)setTextAttributesWithMusicFontSize:(float)musicFontSize
{
    attributes = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                  [NSFont fontWithName:@"Helvetica Neue" size:14.0], NSFontAttributeName,
                  [NSColor blackColor], NSForegroundColorAttributeName,
                  nil];
    musicFontAttributes = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           [NSFont fontWithName:@"Bravura" size:musicFontSize], NSFontAttributeName,
                           [NSColor blueColor], NSForegroundColorAttributeName,
                           nil];
    [self setAccidentalWidth];
}

- (void)setAccidentalWidth
{
    self.flatWidth = [@"b" sizeWithAttributes:musicFontAttributes].width * 0.5;
    self.sharpWidth = [@"#" sizeWithAttributes:musicFontAttributes].width * 0.5;
}

- (void)drawStaffWithClef:(int)clef
               staffWidth:(float)width
              staffHeight:(float)height
            musicFontSize:(float)musicFontSize
{
    [self setTextAttributesWithMusicFontSize:musicFontSize];
    float xStart = self.musicView_x_center - (width/2);
    float yStart = self.musicView_y_center - (height/2);
    clefLocation.x = xStart + (xStart * 0.05);
    clefLocation.y = [self clefVerticalAdjustWithClef:clef
                                          staffHeight:height];
    
    [self drawClefWithClef:clef];
    [currentKeySignature setCurrentClef:clef];
    
    float lineWidthAmount = height / 40;
    staff = [NSBezierPath bezierPath];
    [staff setLineWidth:lineWidthAmount];
    [staff moveToPoint:NSMakePoint(xStart, yStart)];
    [staff lineToPoint:NSMakePoint(xStart, yStart+height)];
    [staff lineToPoint:NSMakePoint(xStart+width, yStart+height)];
    [self drawStaffLineWithXStart:xStart xEnd:xStart+width yPoint:yStart+height];
    [self drawStaffLineWithXStart:xStart xEnd:xStart+width yPoint:yStart+(height * .75)];
    [self drawStaffLineWithXStart:xStart xEnd:xStart+width yPoint:yStart+(height * .5)];
    [self drawStaffLineWithXStart:xStart xEnd:xStart+width yPoint:yStart+(height * .25)];
    [self drawStaffLineWithXStart:xStart xEnd:xStart+width yPoint:yStart];
    [staff setLineJoinStyle:NSBevelLineJoinStyle];
    [staff setLineCapStyle:NSRoundLineCapStyle];
}

- (void)drawStaffLineWithXStart:(float)xStart xEnd:(float)xEnd yPoint:(float)yPoint
{
    [staff moveToPoint:NSMakePoint(xStart, yPoint)];
    [staff lineToPoint:NSMakePoint(xEnd, yPoint)];
}


- (float)clefVerticalAdjustWithClef:(int)clef staffHeight:(float)height
{
    float newClefY = (-0.765 * height) + self.musicView_y_center;
    switch (clef) {
        case 2:
            newClefY = (-0.79 * height) + self.musicView_y_center;
            break;
        case 4:
            newClefY = (-0.515 * height) + self.musicView_y_center;
            break;
            
        default:
            break;
    }
    return newClefY;
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
    
    self.clefWidth = [musicObject sizeWithAttributes:musicFontAttributes].width;
    [musicFontAttributes setObject:[NSColor blackColor] forKey:NSForegroundColorAttributeName];
}

- (void)mouseDown:(NSEvent *)theEvent
{
    NSPoint locationOfMouse = [theEvent locationInWindow];
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
    [musicObject drawAtPoint:clefLocation withAttributes:musicFontAttributes];
    KeySignature *keySignature = [KeySignature sharedKeySignature];
    [self drawKeySignatureWithNumberAccidentals:keySignature.numberOfAccidentals
                                     isSharpKey:keySignature.isSharpKey];
    [staff stroke];
}

@end
