//
//  SOFirstLaunchForVersion.h
//  souban
//
//  Created by Rawlings on 7/4/16.
//  Copyright © 2016 wajiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SOFirstLaunchForVersion : NSObject

/**
*  在同一 app 版本下, 该类是否第一次加载
*
*  @param class
*  @param flag  预留标记, 区分类被复用的情况 (不需要可传 nil)
*
*  @return YES - is first launch
*/
+ (BOOL)checkWithClass:(Class)class flag:(NSString *)flag;

@end
