//
//  User.h
//  MusicTheoryTrainer
//
//  Created by Fupduck Central MBP on 3/23/14.
//  Copyright (c) 2014 Jess Hendricks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject
{
//    int xpTiers[24];
}

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * level;
@property (nonatomic, retain) NSNumber * xp;
@property (nonatomic, retain) NSString * password;

//- (NSNumber *)getLevelFromXP;
- (void) checkLevel;

@end
