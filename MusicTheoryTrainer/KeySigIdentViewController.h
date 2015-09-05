//
//  KeySigIdentViewController.h
//  MusicTheoryDrills
//
//  Created by Jess Hendricks on 9/4/15.
//  Copyright (c) 2015 Jess Hendricks. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <math.h>

@class MusicDisplayView;
@class KeySignature;
@class KeySigGameController;

@interface KeySigIdentViewController : NSViewController
{
    KeySigGameController *keySigGame;
}

@property (weak) IBOutlet MusicDisplayView *mainMusicView;

@property (weak) IBOutlet NSButton *mainButton;
@property (weak) IBOutlet NSTextField *answerField;
@property (weak) IBOutlet NSTextField *instructionalText;
@property (weak) IBOutlet NSTextField *questionNumberDisplay;
@property (weak) IBOutlet NSTextField *scoreDisplay;



//@property int gameState;
@property int numberOfQuestions;
//@property int questionCount;
//@property int currentScore;

//@property (assign) int currentClef;
//@property KeySignature *currentKeySignature;
@property double difficultyLevel;
//@property NSMutableArray *keyAndClefs;
//@property float staffWidth;
//@property float staffHeight;
//@property float musicFontSize;

@property NSString *currentAnswer;

- (IBAction)submitAnswer:(id)sender;

- (void)addStaffWithClef:(int)clef
              staffWidth:(float)width
             staffHeight:(float)height
                       x:(float)xStart
                       y:(float)yStart;

//  TESTING
//- (IBAction)changeClef:(id)sender;
//- (IBAction)changeKey:(id)sender;

//- (void)newGame;
//- (void)changeGameState;

@end
