//
//  KeySigIdentViewController.h
//  MusicTheoryDrills
//
//  Created by Jess Hendricks on 9/4/15.
//  Copyright (c) 2015 Jess Hendricks. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <math.h>
#import "User.h"

@class MusicDisplayView;
@class KeySignature;
@class KeySigGameController;

@interface KeySigIdentViewController : NSViewController
{
    KeySigGameController *keySigGame;
    User *currentUser;
}

@property (weak) IBOutlet MusicDisplayView *mainMusicView;
@property (weak) IBOutlet NSTextField *moduleName;

@property (weak) IBOutlet NSButton *mainButton;
@property (weak) IBOutlet NSTextField *answerField;
@property (weak) IBOutlet NSTextField *instructionalText;
@property (weak) IBOutlet NSTextField *questionNumberDisplay;
@property (weak) IBOutlet NSTextField *scoreDisplay;


@property User *currentUser;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property int numberOfQuestions;
@property double difficultyLevel;
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
