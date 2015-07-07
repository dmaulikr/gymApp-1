//
//  BodyPart.h
//  MyGymApp
//
//  Created by Gamaliel Tellez on 7/7/15.
//  Copyright (c) 2015 Gamaliel Tellez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Exercise;

@interface BodyPart : NSManagedObject

@property (nonatomic, retain) NSString * bodyPartTargeted;
@property (nonatomic, retain) Exercise *exercise;

@end