//
//  JHKeySignatureGame.h
//  KeySignatureQuiz
//
//  Created by Fupduck Central MBP on 1/19/14.
//  Copyright (c) 2014 Jess Hendricks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <math.h>

@class JHMusicView;
@class KeySignature;


@interface JHKeySignatureGame : NSObject

@property (weak) JHMusicView *mainMusicView;
@property (weak) NSButton *mainButton;
@property (weak) IBOutlet NSTextField *answerField;
@property (weak) IBOutlet NSTextField *instructionalText;
@property (weak) IBOutlet NSTextField *questionNumberDisplay;
@property (weak) IBOutlet NSTextField *scoreDisplay;


@property int gameState;
@property int numberOfQuestions;
@property int questionCount;
@property int currentScore;

@property (assign) int currentClef;
@property double difficultyLevel;
@property NSMutableArray *keyAndClefs;
@property KeySignature *currentKeySignature;
@property float staffWidth;
@property float staffHeight;
@property float musicFontSize;

@property NSString *currentAnswer;

- (id)initWithView:(JHMusicView *)newMainMusicView
   instructionText:(NSTextField *)instructionText
            button:(NSButton *)mainButton
       qNumDisplay:(NSTextField *)questionNumberDisplay
      scoreDisplay:(NSTextField *)scoreDisplay
       answerField:(NSTextField *)answerField
        difficulty:(double)difficulty
     questionCount:(int)numberOfQuestions
        staffWidth:(float)width
       staffHeight:(float)height;


- (void)setNewKeyAndClef;
- (void)newGame;
- (void)changeGameState;

@end