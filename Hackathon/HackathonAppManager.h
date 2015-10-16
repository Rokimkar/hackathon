//
//  HackathonAppManager.h
//  Hackathon
//
//  Created by Kunal Chelani on 10/15/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddWishViewController.h"
@interface HackathonAppManager : NSObject


+ (HackathonAppManager*)sharedInstance;

-(NSArray*) getSubCategoriesFor:(NSString*) category;
@property (strong,nonatomic)NSMutableArray* favIdsArray;
@property (assign,nonatomic) UserType appUserType;
-(BOOL) productExist:(NSNumber *)prodId;
-(void) removeItemFromFavIdsArray:(NSNumber *)prodId;
-(void) addItemInFavIdsArray:(NSNumber *)prodId;
@end
