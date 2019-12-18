//
//  MuseHandler.h
//  Muse
//
//  Created by Mike on 08/05/2019.
//  Copyright © 2019 zenox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cloud.h"
#import "ValueItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface MuseHandler : NSObject

+ (instancetype)sharedInstance;
@property (nonatomic, strong) NSArray<ValueItem *> *defaultValues;
@property (nonatomic, strong) NSArray<Cloud *> *defaultClouds;
- (void)updateAllValuesWithDidFinishUpdateValuesHandler:(void (^)(void))didFinishUpdateValues
                        didFinishUpdateDurationsHandler:(void (^)(void))didFinishUpdateDurations;
- (void)checkList:(NSString *)listName
     containValue:(NSString *)value
         feedBack:(void (^)(BOOL didContainValue))feedBack;
- (NSString *)getBestValueByName:(NSString *)name;
- (NSArray *)getValuesByName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
