//
//  HackathonAppManager.h
//  Hackathon
//
//  Created by Kunal Chelani on 10/15/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HackathonAppManager : NSObject


+ (HackathonAppManager*)sharedInstance;

-(NSArray*) getSubCategoriesFor:(NSString*) category;

@end
