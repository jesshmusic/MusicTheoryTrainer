//
//  JHAppDelegate.h
//  MusicTheoryTrainer
//
//  Created by Fupduck Central MBP on 3/23/14.
//  Copyright (c) 2014 Jess Hendricks. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "KeySigIdentification.h"
#import "KeySignature.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)saveAction:(id)sender;



@property (weak) IBOutlet NSArrayController *userArray;

//@property JHMusicView *mainMusicView;
@property KeySigIdentification *keySigGame;


//  Key Signature Game UI

@property (weak) IBOutlet NSTextField *instructionalText;
@property (weak) IBOutlet NSButton *mainButton;
@property (weak) IBOutlet NSTextField *answerField;
@property (weak) IBOutlet NSTextField *questionNumberDisplay;
@property (weak) IBOutlet NSTextField *scoreDisplay;
@property (weak) IBOutlet MusicDisplayView *mainMusicView;

- (IBAction)buttonAction:(id)sender;


//  Main Menu UI
@property double difficulty;
@property BOOL isLoggedIn;
@property (weak) IBOutlet NSWindow *gameSelectWindow;
@property (weak) IBOutlet NSButton *keySigGameButton;
@property (weak) IBOutlet NSSlider *difficultySlider;

- (IBAction)startKeySigQuiz:(id)sender;
- (IBAction)pullUpMainMenu:(id)sender;


@end
