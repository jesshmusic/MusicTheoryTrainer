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
//        NSLog(@"Available fonts: %@", [[[NSFontManager sharedFontManager] availableFontFamilies] description]);
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
    musicFontAttributes = [NSMutableDictionary dictionaryWithObjectsAndKeys: [NSFont fontWithName:@"Bravura" size:musicFontSize],
                           NSFontAttributeName, [NSColor blueColor],
                           NSForegroundColorAttributeName, [NSColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5],
                           NSBackgroundColorAttributeName, nil];
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
    staffHeight = height;
    [self setTextAttributesWithMusicFontSize:musicFontSize];
    float xStart = self.musicView_x_center - (width/2);
//    float yStart = 0.0;
    float yStart = self.musicView_y_center - (height/2);
    clefLocation.x = xStart + (xStart * 0.05);
    clefLocation.y = [self clefVerticalAdjustWithClef:clef
                                          staffHeight:height];
    
    [self drawClefWithClef:clef];
    [currentKeySignature setCurrentClef:clef];
    
//    float lineWidthAmount = height / 40;
    float lineWidthAmount = 1.5;
    staff = [NSBezierPath bezierPath];
    [staff setLineWidth:lineWidthAmount];
    [staff moveToPoint:NSMakePoint(xStart, yStart)];
    [staff lineToPoint:NSMakePoint(xStart, yStart+height)];
    [staff lineToPoint:NSMakePoint(xStart+width, yStart+height)];
    
    //  Actual Staff
    [self drawStaffLineWithXStart:xStart xEnd:xStart+width yPoint:yStart+height];
    NSLog(@"Staff line 1: %f", yStart+height);
    [self drawStaffLineWithXStart:xStart xEnd:xStart+width yPoint:yStart+(height * .75)];
    NSLog(@"Staff line 2: %f", yStart+(height * .75));
    [self drawStaffLineWithXStart:xStart xEnd:xStart+width yPoint:yStart+(height * .5)];
    NSLog(@"Staff line 3: %f", yStart+(height * .5));
    [self drawStaffLineWithXStart:xStart xEnd:xStart+width yPoint:yStart+(height * .25)];
    NSLog(@"Staff line 4: %f", yStart+(height * .25));
    [self drawStaffLineWithXStart:xStart xEnd:xStart+width yPoint:yStart];
    NSLog(@"Staff line 5: %f", yStart);
    //  END Actual Staff
    
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
    NSLog(@"Clef height: %f", [musicObject sizeWithAttributes:musicFontAttributes].height);
    NSLog(@"Staff height: %f", height);
   
    //    float newClefY = (-2.31 * height) + self.musicView_y_center;
    float spaceBetweenLines = height / 4;
    float newClefY = self.musicView_y_center - (spaceBetweenLines * 9.3);
//    NSLog(@"Treble clef offset calc: %f", (-2.31 * height));
//    float newClefY = -([musicObject sizeWithAttributes:musicFontAttributes].height / 2) + 37.5;
//    float newClefY = -90;
    switch (clef) {
        case 2:
            // Bass clef
            NSLog(@"\n\nBass clef");
//            newClefY = self.musicView_y_center - ([musicObject sizeWithAttributes:musicFontAttributes].height / 2) + spaceBetween
              newClefY = self.musicView_y_center - (spaceBetweenLines * 7.3);
//            newClefY = -([musicObject sizeWithAttributes:musicFontAttributes].height / 2) + 37.5;
            NSLog(@"Clef y: %f", newClefY);
            break;
        case 3:
            // Alto clef
            NSLog(@"\n\nAlto clef");
            newClefY = self.musicView_y_center - (spaceBetweenLines * 8.3);
//            newClefY = -([musicObject sizeWithAttributes:musicFontAttributes].height / 2) + 37.5;
            NSLog(@"Clef y: %f", newClefY);
            break;
        case 4:
            // Tenor clef
            NSLog(@"\n\nTenor clef");
            newClefY = self.musicView_y_center - (spaceBetweenLines * 7.3);
//            newClefY = -([musicObject sizeWithAttributes:musicFontAttributes].height / 2) + 37.5;
            NSLog(@"Clef y: %f", newClefY);
            break;
            
        default:
            // Treble clef
            NSLog(@"\n\nTreble clef");
            NSLog(@"Clef y: %f", newClefY);
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
