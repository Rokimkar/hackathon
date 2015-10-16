//
//  ProductData.h
//  Hackathon
//
//  Created by Kunal Chelani on 10/15/15.
//  Copyright (c) 2015 Sanchit Kumar Singh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductData : NSObject

- (void) fetchDataFor:(NSString*)category withSuccess:(void (^) (NSMutableArray *data))success failure:(void (^) (NSError *error)) failure;

- (void) fetchDataFor:(NSString*)category andSubCategory:(NSString*)subCategory withSuccess:(void (^) (NSMutableArray *data))success failure:(void (^) (NSError *error)) failure;

- (void) fetchFavoritesWithSuccess:(void (^) (NSMutableArray *data))success failure:(void (^) (NSError *error)) failure;

- (void) fetchAllDataWithSuccess:(void (^) (NSMutableArray *data))success failure:(void (^) (NSError *error)) failure;

@end
