//
//  JHKeySignature.m
//  MusicTheory
//
//  Created by Fupduck Central MBP on 3/11/14.
//  Copyright (c) 2014 Jess Hendricks. All rights reserved.
//

#import "JHKeySignature.h"

@implementation JHKeySignature
@synthesize topLine, secondLine, thirdLine, fourthLine, bottomLine,
topSpace, firstSpace, secondSpace, thirdSpace, fourthSpace, bottomSpace, afterTheClef,
flatWidth, sharpWidth, clefWidth;

+ (id)sharedKeySignature
{
    static JHKeySignature *sharedKeySignature = nil;
    static dispatch_once_t onceToken;
    dispatch_once (&onceToken, ^{sharedKeySignature = [[self alloc] init];});
    return sharedKeySignature;
}

- (id)init
{
    //default values
    return self;
}


- (void)setLineAndStaffWithStaffWidth:(float)width
                          staffHeight:(float)height
                        view_x_Center:(float)view_x_Center
                        view_y_Center:(float)view_y_Center
                            flatWidth:(float)fWidth
                           sharpWidth:(float)sWidth
                            clefWidth:(float)cWidth
{
    flatWidth = fWidth;
    sharpWidth = sWidth;
    clefWidth = cWidth;

    float adjustedStaffHeight = height;
    float spaceBetween = adjustedStaffHeight/4;
    float staffBottom = view_y_Center - (adjustedStaffHeight/2);
    adjustedStaffHeight = adjustedStaffHeight + staffBottom;
    afterTheClef = view_x_Center - width/2 + (clefWidth + (clefWidth * .4));
    
    [self setStaffLines:spaceBetween adjustedStaffHeight:adjustedStaffHeight];
    
    [self setStaffSpaces:spaceBetween];
    
}

- (void)setStaffLines:(float)spaceBetween adjustedStaffHeight:(float)adjustedStaffHeight
{
    topLine = adjustedStaffHeight - (spaceBetween);
    secondLine = adjustedStaffHeight - (spaceBetween * 2);
    thirdLine = adjustedStaffHeight - (spaceBetween * 3);
    fourthLine = adjustedStaffHeight - (spaceBetween * 4);
    bottomLine = adjustedStaffHeight - (spaceBetween * 5);
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

- (void)setSharpKeyPoints
{
    if (self.currentClef == TREBLE) {
        self.firstAccidental = NSMakePoint(afterTheClef, topLine);
        self.secondAccidental = NSMakePoint(afterTheClef + sharpWidth, secondSpace);
        self.thirdAccidental = NSMakePoint(afterTheClef + (sharpWidth * 2), topSpace);
        self.fourthAccidental = NSMakePoint(afterTheClef + (sharpWidth * 3), secondLine);
        self.fifthAccidental = NSMakePoint(afterTheClef + (sharpWidth * 4), thirdSpace);
        self.sixthAccidental = NSMakePoint(afterTheClef + (sharpWidth * 5), firstSpace);
        self.seventhAccidental = NSMakePoint(afterTheClef + (sharpWidth * 6), thirdLine);
    }
    else if (self.currentClef == BASS) {
        self.firstAccidental = NSMakePoint(afterTheClef, secondLine);
        self.secondAccidental = NSMakePoint(afterTheClef + sharpWidth, thirdSpace);
        self.thirdAccidental = NSMakePoint(afterTheClef + (sharpWidth * 2), firstSpace);
        self.fourthAccidental = NSMakePoint(afterTheClef + (sharpWidth * 3), thirdLine);
        self.fifthAccidental = NSMakePoint(afterTheClef + (sharpWidth * 4), fourthSpace);
        self.sixthAccidental = NSMakePoint(afterTheClef + (sharpWidth * 5), secondSpace);
        self.seventhAccidental = NSMakePoint(afterTheClef + (sharpWidth * 6), fourthLine);
    }
    else if (self.currentClef == ALTO) {
        self.firstAccidental = NSMakePoint(afterTheClef, firstSpace);
        self.secondAccidental = NSMakePoint(afterTheClef + sharpWidth, thirdLine);
        self.thirdAccidental = NSMakePoint(afterTheClef + (sharpWidth * 2), topLine);
        self.fourthAccidental = NSMakePoint(afterTheClef + (sharpWidth * 3), secondSpace);
        self.fifthAccidental = NSMakePoint(afterTheClef + (sharpWidth * 4), fourthLine);
        self.sixthAccidental = NSMakePoint(afterTheClef + (sharpWidth * 5), secondLine);
        self.seventhAccidental = NSMakePoint(afterTheClef + (sharpWidth * 6), thirdSpace);
    }
    else {
        self.firstAccidental = NSMakePoint(afterTheClef, fourthLine);
        self.secondAccidental = NSMakePoint(afterTheClef + sharpWidth, secondLine);
        self.thirdAccidental = NSMakePoint(afterTheClef + (sharpWidth * 2), thirdSpace);
        self.fourthAccidental = NSMakePoint(afterTheClef + (sharpWidth * 3), firstSpace);
        self.fifthAccidental = NSMakePoint(afterTheClef + (sharpWidth * 4), thirdLine);
        self.sixthAccidental = NSMakePoint(afterTheClef + (sharpWidth * 5), topLine);
        self.seventhAccidental = NSMakePoint(afterTheClef + (sharpWidth * 6), secondSpace);
    }
}

- (void)setFlatKeyPoints
{
    if (self.currentClef == TREBLE) {
        self.firstAccidental = NSMakePoint(afterTheClef, thirdLine);
        self.secondAccidental = NSMakePoint(afterTheClef + flatWidth, firstSpace);
        self.thirdAccidental = NSMakePoint(afterTheClef + (flatWidth * 2), thirdSpace);
        self.fourthAccidental = NSMakePoint(afterTheClef + (flatWidth * 3), secondLine);
        self.fifthAccidental = NSMakePoint(afterTheClef + (flatWidth * 4), fourthLine);
        self.sixthAccidental = NSMakePoint(afterTheClef + (flatWidth * 5), secondSpace);
        self.seventhAccidental = NSMakePoint(afterTheClef + (flatWidth * 6), fourthSpace);
    }
    else if (self.currentClef == BASS) {
        self.firstAccidental = NSMakePoint(afterTheClef, fourthLine);
        self.secondAccidental = NSMakePoint(afterTheClef + flatWidth, secondSpace);
        self.thirdAccidental = NSMakePoint(afterTheClef + (flatWidth * 2), fourthSpace);
        self.fourthAccidental = NSMakePoint(afterTheClef + (flatWidth * 3), thirdLine);
        self.fifthAccidental = NSMakePoint(afterTheClef + (flatWidth * 4), bottomLine);
        self.sixthAccidental = NSMakePoint(afterTheClef + (flatWidth * 5), thirdSpace);
        self.seventhAccidental = NSMakePoint(afterTheClef + (flatWidth * 6), bottomSpace);
    }
    else if (self.currentClef == ALTO) {
        self.firstAccidental = NSMakePoint(afterTheClef, thirdSpace);
        self.secondAccidental = NSMakePoint(afterTheClef + flatWidth, secondLine);
        self.thirdAccidental = NSMakePoint(afterTheClef + (flatWidth * 2), fourthLine);
        self.fourthAccidental = NSMakePoint(afterTheClef + (flatWidth * 3), secondSpace);
        self.fifthAccidental = NSMakePoint(afterTheClef + (flatWidth * 4), fourthSpace);
        self.sixthAccidental = NSMakePoint(afterTheClef + (flatWidth * 5), thirdLine);
        self.seventhAccidental = NSMakePoint(afterTheClef + (flatWidth * 6), bottomLine);
    }
    else {
        self.firstAccidental = NSMakePoint(afterTheClef, secondSpace);
        self.secondAccidental = NSMakePoint(afterTheClef + flatWidth, topLine);
        self.thirdAccidental = NSMakePoint(afterTheClef + (flatWidth * 2), thirdLine);
        self.fourthAccidental = NSMakePoint(afterTheClef + (flatWidth * 3), firstSpace);
        self.fifthAccidental = NSMakePoint(afterTheClef + (flatWidth * 4), thirdSpace);
        self.sixthAccidental = NSMakePoint(afterTheClef + (flatWidth * 5), secondLine);
        self.seventhAccidental = NSMakePoint(afterTheClef + (flatWidth * 6), fourthLine);
    }
}

- (void)setKeySignatureWithString:(NSString *)newKeySignature {
    
    self.keyString = newKeySignature;
    if ([self.keyString isEqualToString:@"G"])
    {
        self.numberOfAccidentals = 1;
        self.isSharpKey = true;
        [self setSharpKeyPoints];
    }
    else if([self.keyString isEqualToString:@"D"])
    {
        self.numberOfAccidentals = 2;
        self.isSharpKey = true;
        [self setSharpKeyPoints];
    }
    else if([self.keyString isEqualToString:@"A"])
    {
        self.numberOfAccidentals = 3;
        self.isSharpKey = true;
        [self setSharpKeyPoints];
    }
    else if([self.keyString isEqualToString:@"E"])
    {
        self.numberOfAccidentals = 4;
        self.isSharpKey = true;
        [self setSharpKeyPoints];
    }
    else if([self.keyString isEqualToString:@"B"])
    {
        self.numberOfAccidentals = 5;
        self.isSharpKey = true;
        [self setSharpKeyPoints];
    }
    else if([self.keyString isEqualToString:@"F#"])
    {
        self.numberOfAccidentals = 6;
        self.isSharpKey = true;
        [self setSharpKeyPoints];
    }
    else if([self.keyString isEqualToString:@"C#"])
    {
        self.numberOfAccidentals = 7;
        self.isSharpKey = true;
        [self setSharpKeyPoints];
    }
    else if([self.keyString isEqualToString:@"F"])
    {
        self.numberOfAccidentals = 1;
        self.isSharpKey = false;
        [self setFlatKeyPoints];
    }
    else if([self.keyString isEqualToString:@"Bb"])
    {
        self.numberOfAccidentals = 2;
        self.isSharpKey = false;
        [self setFlatKeyPoints];
    }
    else if([self.keyString isEqualToString:@"Eb"])
    {
        self.numberOfAccidentals = 3;
        self.isSharpKey = false;
        [self setFlatKeyPoints];
    }
    else if([self.keyString isEqualToString:@"Ab"])
    {
        self.numberOfAccidentals = 4;
        self.isSharpKey = false;
        [self setFlatKeyPoints];
    }
    else if([self.keyString isEqualToString:@"Db"])
    {
        self.numberOfAccidentals = 5;
        self.isSharpKey = false;
        [self setFlatKeyPoints];
    }
    else if([self.keyString isEqualToString:@"Gb"])
    {
        self.numberOfAccidentals = 6;
        self.isSharpKey = false;
        [self setFlatKeyPoints];
    }
    else if([self.keyString isEqualToString:@"Cb"])
    {
        self.numberOfAccidentals = 7;
        self.isSharpKey = false;
        [self setFlatKeyPoints];
    }
    else
    {
        self.numberOfAccidentals = 0;
        self.isSharpKey = true;
        [self setFlatKeyPoints];
    }
}

- (void)setClef:(int)newClef
{
    self.currentClef = newClef;
    [self setKeySignatureWithString:self.keyString];
}

- (void)setNewKeySignature:(NSString *)newKeySignature
{
    self.keyString = newKeySignature;
    [self setKeySignatureWithString:self.keyString];
}


@end
