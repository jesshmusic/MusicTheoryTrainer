//
//  Staff.h
//  MusicTheoryTrainer
//
//  Created by Jess Hendricks on 9/3/15.
//  Copyright (c) 2015 Jess Hendricks. All rights reserved.
//

#import <Cocoa/Cocoa.h>
//#import <Foundation/Foundation.h>

@class KeySignature;

@interface Staff : NSObject {
    
    
    //Text Attribute Dictionarys
    NSMutableDictionary *textFontAttributes;
    NSMutableDictionary *musicFontAttributes;
    
    int currentClef;
    float height;
    float width;
    float xStart;
    float yStart;
    float musicFontSize;
    float sharpWidth;
    float flatWidth;
    float clefWidth;
    
    float topLine;
    float secondLine;
    float thirdLine;
    float fourthLine;
    float bottomLine;
    
    float topSpace;
    float firstSpace;
    float secondSpace;
    float thirdSpace;
    float fourthSpace;
    float bottomSpace;
    
    NSPoint firstAccidental;
    NSPoint secondAccidental;
    NSPoint thirdAccidental;
    NSPoint fourthAccidental;
    NSPoint fifthAccidental;
    NSPoint sixthAccidental;
    NSPoint seventhAccidental;
    
    float lineSpace;
    
    float afterTheClef;
}

@property NSMutableDictionary *musicFontAttributes;

@property int currentClef;
@property float height;
@property float width;
@property float xStart;
@property float yStart;
@property float musicFontSize;
@property float sharpWidth;
@property float flatWidth;

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

@property NSPoint clefLocation;

@property NSPoint firstAccidental;
@property NSPoint secondAccidental;
@property NSPoint thirdAccidental;
@property NSPoint fourthAccidental;
@property NSPoint fifthAccidental;
@property NSPoint sixthAccidental;
@property NSPoint seventhAccidental;

@property float lineSpace;

@property float afterTheClef;

- (id)initWithWidth:(float)staffWidth
             height:(float)staffHeight
             xStart:(float)x
             yStart:(float)y
       keySignature:(KeySignature *)keySig
               clef:(int)clef;

@end


