//
//  CloudHandler.h
//  Muse
//
//  Created by Mike on 08/05/2019.
//  Copyright © 2019 zenox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cloud.h"

NS_ASSUME_NONNULL_BEGIN

@interface CloudHandler : NSObject

+ (instancetype)sharedInstance;
@property (nonatomic, strong) NSArray<Cloud *> *defaultClouds;
@property (nonatomic, strong) Cloud *enableCloud;
@property (nonatomic, assign) NSInteger currentIndex;

@end

NS_ASSUME_NONNULL_END
