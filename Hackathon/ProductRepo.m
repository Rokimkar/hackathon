//
//  ProductRepo.m
//  Hackathon
//
//  Created by Kunal Chelani on 10/17/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "ProductRepo.h"

@implementation ProductRepo



-(instancetype) init
{
    self=[super init];
    if(self)
    {
        self.prodsArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [self autoEncodeWithCoder:coder];
}

- (id)initWithCoder:(NSCoder *)coder {
    if (self = [super init]) {
        [self autoDecode:coder];
    }
    return self;
}


@end
