//
//  JHKeySignature.m
//  MusicTheory
//
//  Created by Fupduck Central MBP on 3/11/14.
//  Copyright (c) 2014 Jess Hendricks. All rights reserved.
//

#import "KeySignature.h"

@implementation KeySignature
@synthesize flatWidth, sharpWidth, clefWidth;
//@synthesize topLine, secondLine, thirdLine, fourthLine, bottomLine,
//topSpace, firstSpace, secondSpace, thirdSpace, fourthSpace, bottomSpace, afterTheClef,
//flatWidth, sharpWidth, clefWidth;

+ (id)sharedKeySignature
{
    static KeySignature *sharedKeySignature = nil;
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
    
    _staff = [[Staff alloc] initWithWidth:width staffHeight:height view_x_Center:view_x_Center view_y_Center:view_y_Center clefWidth:cWidth];
    
//    float adjustedStaffHeight = height;
//    float spaceBetween = adjustedStaffHeight/4;
//    float staffBottom = view_y_Center - (adjustedStaffHeight/2);
//    adjustedStaffHeight = adjustedStaffHeight + staffBottom;
//    afterTheClef = view_x_Center - width/2 + (clefWidth + (clefWidth * .4));
    
//    [self setStaffLines:spaceBetween adjustedStaffHeight:adjustedStaffHeight];
//    
//    [self setStaffSpaces:spaceBetween];
    
}

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

- (void)setSharpKeyPoints
{
    if (self.currentClef == TREBLE) {
        self.firstAccidental = NSMakePoint(_staff.afterTheClef, _staff.topLine);
        self.secondAccidental = NSMakePoint(_staff.afterTheClef + sharpWidth, _staff.secondSpace);
        self.thirdAccidental = NSMakePoint(_staff.afterTheClef + (sharpWidth * 2), _staff.topSpace);
        self.fourthAccidental = NSMakePoint(_staff.afterTheClef + (sharpWidth * 3), _staff.secondLine);
        self.fifthAccidental = NSMakePoint(_staff.afterTheClef + (sharpWidth * 4), _staff.thirdSpace);
        self.sixthAccidental = NSMakePoint(_staff.afterTheClef + (sharpWidth * 5), _staff.firstSpace);
        self.seventhAccidental = NSMakePoint(_staff.afterTheClef + (sharpWidth * 6), _staff.thirdLine);
    }
    else if (self.currentClef == BASS) {
        self.firstAccidental = NSMakePoint(_staff.afterTheClef, _staff.secondLine);
        self.secondAccidental = NSMakePoint(_staff.afterTheClef + sharpWidth, _staff.thirdSpace);
        self.thirdAccidental = NSMakePoint(_staff.afterTheClef + (sharpWidth * 2), _staff.firstSpace);
        self.fourthAccidental = NSMakePoint(_staff.afterTheClef + (sharpWidth * 3), _staff.thirdLine);
        self.fifthAccidental = NSMakePoint(_staff.afterTheClef + (sharpWidth * 4), _staff.fourthSpace);
        self.sixthAccidental = NSMakePoint(_staff.afterTheClef + (sharpWidth * 5), _staff.secondSpace);
        self.seventhAccidental = NSMakePoint(_staff.afterTheClef + (sharpWidth * 6), _staff.fourthLine);
    }
    else if (self.currentClef == ALTO) {
        self.firstAccidental = NSMakePoint(_staff.afterTheClef, _staff.firstSpace);
        self.secondAccidental = NSMakePoint(_staff.afterTheClef + sharpWidth, _staff.thirdLine);
        self.thirdAccidental = NSMakePoint(_staff.afterTheClef + (sharpWidth * 2), _staff.topLine);
        self.fourthAccidental = NSMakePoint(_staff.afterTheClef + (sharpWidth * 3), _staff.secondSpace);
        self.fifthAccidental = NSMakePoint(_staff.afterTheClef + (sharpWidth * 4), _staff.fourthLine);
        self.sixthAccidental = NSMakePoint(_staff.afterTheClef + (sharpWidth * 5), _staff.secondLine);
        self.seventhAccidental = NSMakePoint(_staff.afterTheClef + (sharpWidth * 6), _staff.thirdSpace);
    }
    else {
        self.firstAccidental = NSMakePoint(_staff.afterTheClef, _staff.fourthLine);
        self.secondAccidental = NSMakePoint(_staff.afterTheClef + sharpWidth, _staff.secondLine);
        self.thirdAccidental = NSMakePoint(_staff.afterTheClef + (sharpWidth * 2), _staff.thirdSpace);
        self.fourthAccidental = NSMakePoint(_staff.afterTheClef + (sharpWidth * 3), _staff.firstSpace);
        self.fifthAccidental = NSMakePoint(_staff.afterTheClef + (sharpWidth * 4), _staff.thirdLine);
        self.sixthAccidental = NSMakePoint(_staff.afterTheClef + (sharpWidth * 5), _staff.topLine);
        self.seventhAccidental = NSMakePoint(_staff.afterTheClef + (sharpWidth * 6), _staff.secondSpace);
    }
}

- (void)setFlatKeyPoints
{
    if (self.currentClef == TREBLE) {
        self.firstAccidental = NSMakePoint(_staff.afterTheClef, _staff.thirdLine);
        self.secondAccidental = NSMakePoint(_staff.afterTheClef + flatWidth, _staff.firstSpace);
        self.thirdAccidental = NSMakePoint(_staff.afterTheClef + (flatWidth * 2), _staff.thirdSpace);
        self.fourthAccidental = NSMakePoint(_staff.afterTheClef + (flatWidth * 3), _staff.secondLine);
        self.fifthAccidental = NSMakePoint(_staff.afterTheClef + (flatWidth * 4), _staff.fourthLine);
        self.sixthAccidental = NSMakePoint(_staff.afterTheClef + (flatWidth * 5), _staff.secondSpace);
        self.seventhAccidental = NSMakePoint(_staff.afterTheClef + (flatWidth * 6), _staff.fourthSpace);
    }
    else if (self.currentClef == BASS) {
        self.firstAccidental = NSMakePoint(_staff.afterTheClef, _staff.fourthLine);
        self.secondAccidental = NSMakePoint(_staff.afterTheClef + flatWidth, _staff.secondSpace);
        self.thirdAccidental = NSMakePoint(_staff.afterTheClef + (flatWidth * 2), _staff.fourthSpace);
        self.fourthAccidental = NSMakePoint(_staff.afterTheClef + (flatWidth * 3), _staff.thirdLine);
        self.fifthAccidental = NSMakePoint(_staff.afterTheClef + (flatWidth * 4), _staff.bottomLine);
        self.sixthAccidental = NSMakePoint(_staff.afterTheClef + (flatWidth * 5), _staff.thirdSpace);
        self.seventhAccidental = NSMakePoint(_staff.afterTheClef + (flatWidth * 6), _staff.bottomSpace);
    }
    else if (self.currentClef == ALTO) {
        self.firstAccidental = NSMakePoint(_staff.afterTheClef, _staff.thirdSpace);
        self.secondAccidental = NSMakePoint(_staff.afterTheClef + flatWidth, _staff.secondLine);
        self.thirdAccidental = NSMakePoint(_staff.afterTheClef + (flatWidth * 2), _staff.fourthLine);
        self.fourthAccidental = NSMakePoint(_staff.afterTheClef + (flatWidth * 3), _staff.secondSpace);
        self.fifthAccidental = NSMakePoint(_staff.afterTheClef + (flatWidth * 4), _staff.fourthSpace);
        self.sixthAccidental = NSMakePoint(_staff.afterTheClef + (flatWidth * 5), _staff.thirdLine);
        self.seventhAccidental = NSMakePoint(_staff.afterTheClef + (flatWidth * 6), _staff.bottomLine);
    }
    else {
        self.firstAccidental = NSMakePoint(_staff.afterTheClef, _staff.secondSpace);
        self.secondAccidental = NSMakePoint(_staff.afterTheClef + flatWidth, _staff.topLine);
        self.thirdAccidental = NSMakePoint(_staff.afterTheClef + (flatWidth * 2), _staff.thirdLine);
        self.fourthAccidental = NSMakePoint(_staff.afterTheClef + (flatWidth * 3), _staff.firstSpace);
        self.fifthAccidental = NSMakePoint(_staff.afterTheClef + (flatWidth * 4), _staff.thirdSpace);
        self.sixthAccidental = NSMakePoint(_staff.afterTheClef + (flatWidth * 5), _staff.secondLine);
        self.seventhAccidental = NSMakePoint(_staff.afterTheClef + (flatWidth * 6), _staff.fourthLine);
    }
}

- (void)setKeySignatureWithString:(NSString *)newKeySignature {
    
    self.keySignatureName = newKeySignature;
    if ([self.keySignatureName isEqualToString:@"G"])
    {
        [self setNumberOfAccidentals:1 isSharpKey:true];
    }
    else if([self.keySignatureName isEqualToString:@"D"])
    {
        [self setNumberOfAccidentals:2 isSharpKey:true];
    }
    else if([self.keySignatureName isEqualToString:@"A"])
    {
        [self setNumberOfAccidentals:3 isSharpKey:true];
    }
    else if([self.keySignatureName isEqualToString:@"E"])
    {
        [self setNumberOfAccidentals:4 isSharpKey:true];
    }
    else if([self.keySignatureName isEqualToString:@"B"])
    {
        [self setNumberOfAccidentals:5 isSharpKey:true];
    }
    else if([self.keySignatureName isEqualToString:@"F#"])
    {
        [self setNumberOfAccidentals:6 isSharpKey:true];
    }
    else if([self.keySignatureName isEqualToString:@"C#"])
    {
        [self setNumberOfAccidentals:7 isSharpKey:true];
    }
    else if([self.keySignatureName isEqualToString:@"F"])
    {
        [self setNumberOfAccidentals:1 isSharpKey:false];
    }
    else if([self.keySignatureName isEqualToString:@"Bb"])
    {
        [self setNumberOfAccidentals:2 isSharpKey:false];
    }
    else if([self.keySignatureName isEqualToString:@"Eb"])
    {
        [self setNumberOfAccidentals:3 isSharpKey:false];
    }
    else if([self.keySignatureName isEqualToString:@"Ab"])
    {
        [self setNumberOfAccidentals:4 isSharpKey:false];
    }
    else if([self.keySignatureName isEqualToString:@"Db"])
    {
        [self setNumberOfAccidentals:5 isSharpKey:false];
    }
    else if([self.keySignatureName isEqualToString:@"Gb"])
    {
        [self setNumberOfAccidentals:6 isSharpKey:false];
    }
    else if([self.keySignatureName isEqualToString:@"Cb"])
    {
        [self setNumberOfAccidentals:7 isSharpKey:false];
    }
    else
    {
        [self setNumberOfAccidentals:0 isSharpKey:false];
    }
}

- (void)setNumberOfAccidentals:(int)numberOfAccidentals isSharpKey:(BOOL)isSharpKey
{
    self.numberOfAccidentals = numberOfAccidentals;
    self.isSharpKey = isSharpKey;
    if (isSharpKey) {
        [self setSharpKeyPoints];
    } else {
        [self setFlatKeyPoints];
    }
}

- (void)setClef:(int)newClef
{
    self.currentClef = newClef;
    [self setKeySignatureWithString:self.keySignatureName];
}

- (void)setNewKeySignature:(NSString *)newKeySignature
{
    self.keySignatureName = newKeySignature;
    [self setKeySignatureWithString:self.keySignatureName];
}


@end
