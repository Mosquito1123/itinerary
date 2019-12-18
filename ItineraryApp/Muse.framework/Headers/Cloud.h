//
//  Cloud.h
//  Muse
//
//  Created by Mike on 08/05/2019.
//  Copyright © 2019 zenox. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    CloudTypeBmob,
    CloudTypeLean,
    CloudTypeApi,
    CloudTypeDroi
} CloudType;

NS_ASSUME_NONNULL_BEGIN

@interface Cloud : NSObject

@property (nonatomic, assign) CloudType type;
@property (nonatomic, strong) NSString *requestUrl;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *appKeyK;
@property (nonatomic, strong) NSString *appIDK;
@property (nonatomic, strong) NSString *appID;
@property (nonatomic, strong) NSString *appKey;

+ (instancetype)cloudWithType:(CloudType)type
                   requestUrl:(NSString *)requestUrl
                         name:(NSString *)name
                      appKeyK:(NSString *)appKeyK
                       appKey:(NSString *)appKey
                       appIDK:(NSString *)appIDK
                        appID:(NSString *)appID;

@end

NS_ASSUME_NONNULL_END
