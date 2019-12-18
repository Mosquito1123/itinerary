//
//  ValueItem.h
//  Muse
//
//  Created by Mike on 22/05/2019.
//  Copyright © 2019 zenox. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ValueItem : NSObject

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *extra;
@property (nullable, nonatomic, copy) NSString *value;
@property (nonatomic) int16_t type;

+ (instancetype)valueItemWithName:(NSString *)name
                            extra:(NSString *)extra
                            value:(NSString *)value
                             type:(int16_t)type;

@end

NS_ASSUME_NONNULL_END
