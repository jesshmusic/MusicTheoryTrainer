//
//  JHAppDelegate.h
//  MusicTheoryTrainer
//
//  Created by Fupduck Central MBP on 3/23/14.
//  Copyright (c) 2014 Jess Hendricks. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "JHKeySignatureGame.h"
#import "JHKeySignature.h"

@interface JHAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)saveAction:(id)sender;




//@property JHMusicView *mainMusicView;
@property JHKeySignatureGame *keySigGame;


//  Key Signature Game UI

@property (weak) IBOutlet NSTextField *instructionalText;
@property (weak) IBOutlet NSButton *mainButton;
@property (weak) IBOutlet NSTextField *answerField;
@property (weak) IBOutlet NSTextField *questionNumberDisplay;
@property (weak) IBOutlet NSTextField *scoreDisplay;
@property (weak) IBOutlet JHMusicView *mainMusicView;

- (IBAction)buttonAction:(id)sender;


//  Main Menu UI
@property double difficulty;
@property BOOL isLoggedIn;
@property (weak) IBOutlet NSWindow *gameSelectWindow;
@property (weak) IBOutlet NSTextField *userNameDisplay;

@property (weak) IBOutlet NSButton *loadUserButton;
@property (weak) IBOutlet NSButton *userCreateButton;
@property (weak) IBOutlet NSButton *keySigGameButton;
@property (weak) IBOutlet NSSlider *difficultySlider;

- (IBAction)loadUser:(id)sender;
- (IBAction)createNewUser:(id)sender;
- (IBAction)startKeySigQuiz:(id)sender;
- (IBAction)pullUpMainMenu:(id)sender;

// Create User Panel
@property (weak) IBOutlet NSWindow *createNewUserWindow;

@property (weak) IBOutlet NSTextField *createUserName;
@property (weak) IBOutlet NSSecureTextField *createUserPassword;

- (IBAction)createUser:(id)sender;
@end
