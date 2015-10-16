//
//  ProductData.m
//  Hackathon
//
//  Created by Kunal Chelani on 10/15/15.
//  Copyright (c) 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "ProductData.h"
#import "Product.h"
#import "HackathonAppManager.h"
@implementation ProductData

- (void) fetchDataFor:(NSString*)category withSuccess:(void (^) (NSMutableArray *data))success failure:(void (^) (NSError *error)) failure{
    id object = [self getObjectFromJSON];
    if (!object) {
        failure(nil);
    }
    else
    {
        success([self getDataFrom:[object valueForKey:@"items"] forCategory:category]);
    }
}


- (void) fetchDataFor:(NSString*)category andSubCategory:(NSString*)subCategory withSuccess:(void (^) (NSMutableArray *data))success failure:(void (^) (NSError *error)) failure{
    
    id object = [self getObjectFromJSON];
    if (!object) {
        failure(nil);
    }
    else
    {
        success([self getDataFrom:[object valueForKey:@"items"] forCategory:category andSubCategory:subCategory]);
    }
    
    
}

- (void) fetchFavoritesWithSuccess:(void (^) (NSMutableArray *data))success failure:(void (^) (NSError *error)) failure{
    
    
    id object = [self getObjectFromJSON];
    if (!object) {
        failure(nil);
    }
    else
    {
        success([self getFavDataFrom:[object valueForKey:@"items"]]);
    }
}

- (void) fetchWishDataWithSuccess:(void (^) (NSMutableArray *data))success failure:(void (^) (NSError *error)) failure{
    
    
    id object = [self getObjectFromJSON];
    if (!object) {
        failure(nil);
    }
    else
    {
        NSMutableArray* dataArray = [self getFavDataFrom:[self getDataFrom:[object valueForKey:@"items"] forCategory:@"Clothing"]];
        if ([HackathonAppManager sharedInstance].appUserType==kSeller) {
            NSMutableArray *array = [HackathonAppManager sharedInstance].sellerResponses.prodsArray;
            if (!array) {
                array = [[NSMutableArray alloc] init];
            }
            [array addObjectsFromArray:dataArray];
            success(array);
        }
        else{
            NSMutableArray *array = [HackathonAppManager sharedInstance].buyerWishes.prodsArray;
            if (!array) {
                array = [[NSMutableArray alloc] init];
            }
            [array addObjectsFromArray:dataArray];
            success(array);
        }
    }
}


- (void) fetchAllDataWithSuccess:(void (^) (NSMutableArray *data))success failure:(void (^) (NSError *error)) failure{
    id object = [self getObjectFromJSON];
    if (!object) {
        failure(nil);
    }
    else
    {
        success([self getDataFrom:[object valueForKey:@"items"]]);
    }
}



-(id) getObjectFromJSON{
    
    NSError *deserializingError;
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSString *finalPath = [path stringByAppendingPathComponent:@"prods.json"];
    NSURL *localFileURL = [NSURL fileURLWithPath:finalPath];
    NSData *contentOfLocalFile = [NSData dataWithContentsOfURL:localFileURL];
    id object = [NSJSONSerialization JSONObjectWithData:contentOfLocalFile
                                                options:NSJSONReadingMutableContainers
                                                  error:&deserializingError];
    return object;
    
}

-(NSMutableArray*) getDataFrom:(id)dataObject
{
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    for (NSMutableDictionary *prodObj in dataObject) {
            [dataArray addObject:[self mapWith:prodObj]];
    }
    return dataArray;
}


-(NSMutableArray*) getDataFrom:(id)dataObject forCategory:(NSString*)category
{
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    for (NSMutableDictionary *prodObj in dataObject) {
        if ([[prodObj objectForKey:@"category"] isEqualToString:category]) {
            [dataArray addObject:[self mapWith:prodObj]];
        }
    }
    return dataArray;
}

-(NSMutableArray*) getDataFrom:(id)dataObject forCategory:(NSString*)category andSubCategory:(NSString*)subCategory
{
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    for (NSMutableDictionary *prodObj in dataObject) {
        if ([[prodObj objectForKey:@"category"] isEqualToString:category] && [[prodObj objectForKey:@"subcategory"] isEqualToString:subCategory]) {
            [dataArray addObject:[self mapWith:prodObj]];
        }
    }
    return dataArray;
}
-(NSMutableArray*) getFavDataFrom:(id)dataObject{
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    for (NSMutableDictionary *prodObj in dataObject) {
        if ([[HackathonAppManager sharedInstance] productExist:[NSNumber numberWithInt:[[prodObj objectForKey:@"prodId"] intValue]]]) {
            [dataArray addObject:[self mapWith:prodObj]];
        }
    }
    return dataArray;
}


-(Product*) mapWith:(NSMutableDictionary*)prodObj{
    Product *product = [[Product alloc] init];
    product.title = [prodObj objectForKey:@"title"];
    product.prodDesc = [prodObj objectForKey:@"prodDesc"];
    product.price = [prodObj objectForKey:@"price"];
    product.upperPrice = [prodObj objectForKey:@"upperPrice"];
    product.quantity = [[prodObj objectForKey:@"quantity"] intValue];
    product.prodId = [[prodObj objectForKey:@"prodId"] intValue];
    product.category = [prodObj objectForKey:@"category"];
    product.subcategory = [prodObj objectForKey:@"subcategory"];
    product.img1 = [prodObj objectForKey:@"img1"];
    product.img2 = [prodObj objectForKey:@"img2"];
    product.img3 = [prodObj objectForKey:@"img3"];
    product.seller = [prodObj objectForKey:@"seller"];
    product.type = [prodObj objectForKey:@"type"];

    return product;
}

@end
