//
//  HackathonAppManager.h
//  Hackathon
//
//  Created by Kunal Chelani on 10/15/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddWishViewController.h"
#import "ProductRepo.h"
@interface HackathonAppManager : NSObject


+ (HackathonAppManager*)sharedInstance;

-(NSArray*) getSubCategoriesFor:(NSString*) category;
@property (strong,nonatomic)NSMutableArray* favIdsArray;
@property (assign,nonatomic) UserType appUserType;
@property (strong,nonatomic) ProductRepo *buyerWishes;
@property (strong,nonatomic) ProductRepo *sellerResponses;



-(void) addProduct:(Product*) product;
-(BOOL) productExist:(NSNumber *)prodId;
-(void) removeItemFromFavIdsArray:(NSNumber *)prodId;
-(void) addItemInFavIdsArray:(NSNumber *)prodId;
@end
