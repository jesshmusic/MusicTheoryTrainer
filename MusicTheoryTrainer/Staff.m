//
//  Staff.m
//  MusicTheoryTrainer
//
//  Created by Jess Hendricks on 9/3/15.
//  Copyright (c) 2015 Jess Hendricks. All rights reserved.
//

#import "Staff.h"
#import "MusicTheoryConstants.h"
#import "KeySignature.h"

@implementation Staff
@synthesize musicFontAttributes, currentClef, height, width, xStart, yStart, musicFontSize, sharpWidth, flatWidth, topLine, secondLine, thirdLine, fourthLine, bottomLine,
topSpace, firstSpace, secondSpace, thirdSpace, fourthSpace, bottomSpace, lineSpace, afterTheClef, firstAccidental, secondAccidental, thirdAccidental,
fourthAccidental, fifthAccidental, sixthAccidental, seventhAccidental, clefLocation;

- (id)initWithWidth:(float)staffWidth
             height:(float)staffHeight
             xStart:(float)x
             yStart:(float)y
       keySignature:(KeySignature *)keySig
               clef:(int)clef
{
    currentClef = clef;
    height = staffHeight;
    width = staffWidth;
    xStart = x;
    yStart = y;
    lineSpace = staffHeight / 4;
    musicFontSize = height + (height * .025);
    [self setFontAttributes];
    [self setAccidentalWidth];
    [self calculateClefLocation:currentClef];
    [self setStaffLines];
    [self setStaffSpaces];
    if (keySig.isSharpKey) {
        [self setSharpKeyPoints];
    } else {
        [self setFlatKeyPoints];
    }
    
    return self;
}

- (void)setStaffLines
{
    topLine = yStart + (lineSpace * 4.0) - (lineSpace * 8.3);
    secondLine = yStart + (lineSpace * 3.0) - (lineSpace * 8.3);
    thirdLine = yStart + (lineSpace * 2.0) - (lineSpace * 8.3);
    fourthLine = yStart + lineSpace - (lineSpace * 8.3);
    bottomLine = yStart - (lineSpace * 8.3);
}

- (void)setStaffSpaces
{
    topSpace = topLine + (lineSpace * .5);
    firstSpace = secondLine + (lineSpace * .5);
    secondSpace = thirdLine + (lineSpace * .5);
    thirdSpace = fourthLine + (lineSpace * .5);
    fourthSpace = bottomLine + (lineSpace * .5);
    bottomSpace = bottomLine - (lineSpace * .5);
}

- (void)setFontAttributes
{
    textFontAttributes = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                  [NSFont fontWithName:@"Helvetica Neue" size:14.0], NSFontAttributeName,
                  [NSColor blackColor], NSForegroundColorAttributeName,
                  nil];
    musicFontAttributes = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                           [NSFont fontWithName:@"Bravura" size:musicFontSize], NSFontAttributeName,
                           [NSColor blackColor], NSForegroundColorAttributeName,
                           //                            [NSColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5], NSBackgroundColorAttributeName,
                           nil];
}

- (void)setAccidentalWidth
{
    flatWidth = [@"b" sizeWithAttributes:musicFontAttributes].width * 0.5;
    sharpWidth = [@"#" sizeWithAttributes:musicFontAttributes].width * 0.5;
    clefWidth = [[NSString stringWithFormat:@"%C", TENOR_CLEF] sizeWithAttributes:musicFontAttributes].width;
    afterTheClef = xStart + (clefWidth + (clefWidth * .2));
}

- (void)setSharpKeyPoints
{
    if (currentClef == TREBLE) {
        firstAccidental = NSMakePoint(afterTheClef, topLine);
        secondAccidental = NSMakePoint(afterTheClef + sharpWidth, secondSpace);
        thirdAccidental = NSMakePoint(afterTheClef + (sharpWidth * 2), topSpace);
        fourthAccidental = NSMakePoint(afterTheClef + (sharpWidth * 3), secondLine);
        fifthAccidental = NSMakePoint(afterTheClef + (sharpWidth * 4), thirdSpace);
        sixthAccidental = NSMakePoint(afterTheClef + (sharpWidth * 5), firstSpace);
        seventhAccidental = NSMakePoint(afterTheClef + (sharpWidth * 6), thirdLine);
    }
    else if (currentClef == BASS) {
        firstAccidental = NSMakePoint(afterTheClef, secondLine);
        secondAccidental = NSMakePoint(afterTheClef + sharpWidth, thirdSpace);
        thirdAccidental = NSMakePoint(afterTheClef + (sharpWidth * 2), firstSpace);
        fourthAccidental = NSMakePoint(afterTheClef + (sharpWidth * 3), thirdLine);
        fifthAccidental = NSMakePoint(afterTheClef + (sharpWidth * 4), fourthSpace);
        sixthAccidental = NSMakePoint(afterTheClef + (sharpWidth * 5), secondSpace);
        seventhAccidental = NSMakePoint(afterTheClef + (sharpWidth * 6), fourthLine);
    }
    else if (currentClef == ALTO) {
        firstAccidental = NSMakePoint(afterTheClef, firstSpace);
        secondAccidental = NSMakePoint(afterTheClef + sharpWidth, thirdLine);
        thirdAccidental = NSMakePoint(afterTheClef + (sharpWidth * 2), topLine);
        fourthAccidental = NSMakePoint(afterTheClef + (sharpWidth * 3), secondSpace);
        fifthAccidental = NSMakePoint(afterTheClef + (sharpWidth * 4), fourthLine);
        sixthAccidental = NSMakePoint(afterTheClef + (sharpWidth * 5), secondLine);
        seventhAccidental = NSMakePoint(afterTheClef + (sharpWidth * 6), thirdSpace);
    }
    else {
        firstAccidental = NSMakePoint(afterTheClef, fourthLine);
        secondAccidental = NSMakePoint(afterTheClef + sharpWidth, secondLine);
        thirdAccidental = NSMakePoint(afterTheClef + (sharpWidth * 2), thirdSpace);
        fourthAccidental = NSMakePoint(afterTheClef + (sharpWidth * 3), firstSpace);
        fifthAccidental = NSMakePoint(afterTheClef + (sharpWidth * 4), thirdLine);
        sixthAccidental = NSMakePoint(afterTheClef + (sharpWidth * 5), topLine);
        seventhAccidental = NSMakePoint(afterTheClef + (sharpWidth * 6), secondSpace);
    }
}

- (void)setFlatKeyPoints
{
    if (currentClef == TREBLE) {
        firstAccidental = NSMakePoint(afterTheClef, thirdLine);
        secondAccidental = NSMakePoint(afterTheClef + flatWidth, firstSpace);
        thirdAccidental = NSMakePoint(afterTheClef + (flatWidth * 2), thirdSpace);
        fourthAccidental = NSMakePoint(afterTheClef + (flatWidth * 3), secondLine);
        fifthAccidental = NSMakePoint(afterTheClef + (flatWidth * 4), fourthLine);
        sixthAccidental = NSMakePoint(afterTheClef + (flatWidth * 5), secondSpace);
        seventhAccidental = NSMakePoint(afterTheClef + (flatWidth * 6), fourthSpace);
    }
    else if (currentClef == BASS) {
        firstAccidental = NSMakePoint(afterTheClef, fourthLine);
        secondAccidental = NSMakePoint(afterTheClef + flatWidth, secondSpace);
        thirdAccidental = NSMakePoint(afterTheClef + (flatWidth * 2), fourthSpace);
        fourthAccidental = NSMakePoint(afterTheClef + (flatWidth * 3), thirdLine);
        fifthAccidental = NSMakePoint(afterTheClef + (flatWidth * 4), bottomLine);
        sixthAccidental = NSMakePoint(afterTheClef + (flatWidth * 5), thirdSpace);
        seventhAccidental = NSMakePoint(afterTheClef + (flatWidth * 6), bottomSpace);
    }
    else if (currentClef == ALTO) {
        firstAccidental = NSMakePoint(afterTheClef, thirdSpace);
        secondAccidental = NSMakePoint(afterTheClef + flatWidth, secondLine);
        thirdAccidental = NSMakePoint(afterTheClef + (flatWidth * 2), fourthLine);
        fourthAccidental = NSMakePoint(afterTheClef + (flatWidth * 3), secondSpace);
        fifthAccidental = NSMakePoint(afterTheClef + (flatWidth * 4), fourthSpace);
        sixthAccidental = NSMakePoint(afterTheClef + (flatWidth * 5), thirdLine);
        seventhAccidental = NSMakePoint(afterTheClef + (flatWidth * 6), bottomLine);
    }
    else {
        firstAccidental = NSMakePoint(afterTheClef, secondSpace);
        secondAccidental = NSMakePoint(afterTheClef + flatWidth, topLine);
        thirdAccidental = NSMakePoint(afterTheClef + (flatWidth * 2), thirdLine);
        fourthAccidental = NSMakePoint(afterTheClef + (flatWidth * 3), firstSpace);
        fifthAccidental = NSMakePoint(afterTheClef + (flatWidth * 4), thirdSpace);
        sixthAccidental = NSMakePoint(afterTheClef + (flatWidth * 5), secondLine);
        seventhAccidental = NSMakePoint(afterTheClef + (flatWidth * 6), fourthLine);
    }
}


- (void)calculateClefLocation:(int)clef
{
    clefLocation.x = xStart + (xStart * 0.05);
    clefLocation.y = yStart - lineSpace * 7.3;
    switch (clef) {
        case 2:
            // Bass clef
            //            NSLog(@"\n\nBass clef");
            clefLocation.y = yStart - (lineSpace * 5.3);
            break;
        case 3:
            // Alto clef
            //            NSLog(@"\n\nAlto clef");
            clefLocation.y = yStart - (lineSpace * 6.3);
            break;
        case 4:
            // Tenor clef
            //            NSLog(@"\n\nTenor clef");
            clefLocation.y = yStart - (lineSpace * 5.3);
            break;
            
        default:
            // Treble clef
            //            NSLog(@"\n\nTreble clef");
            break;
    }
}

- (NSString *)description
{
    NSString *returnString = [NSString stringWithFormat:@"\nSTAFF.\n\tHeight: %f\tWidth: %f\n\tx: %f\ty: %f\n\nLines:\n\t1: %f\n\t2: %f\n\t3: %f\n\t4: %f\n\t5: %f\n\nSpace after clef: %f",
                              height, width, xStart, yStart, topLine, secondLine, thirdLine, fourthLine, bottomLine, afterTheClef];
    return returnString;
}


//    self.musicFontSize = self.height + (self.height * .03);
//    float spaceBetween = self.height/4;
//    float staffBottom = view_y_Center - (adjustedStaffHeight/2);
//    float staffBottom = yStart;
//    float adjustedStaffHeight = self.height + staffBottom;

//    [self setStaffLines:spaceBetween adjustedStaffHeight:adjustedStaffHeight];
//    [self setStaffSpaces:spaceBetween];

//- (void)setStaffLines:(float)spaceBetween adjustedStaffHeight:(float)adjustedStaffHeight
//{
//    topLine = adjustedStaffHeight - (spaceBetween * 8.3);
//    secondLine = adjustedStaffHeight - (spaceBetween * 9.3);
//    thirdLine = adjustedStaffHeight - (spaceBetween * 10.3);
//    fourthLine = adjustedStaffHeight - (spaceBetween * 11.3);
//    bottomLine = adjustedStaffHeight - (spaceBetween * 12.3);
//}
//
//- (void)setStaffSpaces:(float)spaceBetween
//{
//    topSpace = topLine + (spaceBetween * .5);
//    firstSpace = secondLine + (spaceBetween * .5);
//    secondSpace = thirdLine + (spaceBetween * .5);
//    thirdSpace = fourthLine + (spaceBetween * .5);
//    fourthSpace = bottomLine + (spaceBetween * .5);
//    bottomSpace = bottomLine - (spaceBetween * .5);
//}



@end
