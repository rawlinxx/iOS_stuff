//
//  SOFirstLaunchForVersion.m
//  souban
//
//  Created by Rawlings on 7/4/16.
//  Copyright © 2016 wajiang. All rights reserved.
//

#import "SOFirstLaunchForVersion.h"

@implementation SOFirstLaunchForVersion

+ (BOOL)checkWithClass:(Class)class flag:(NSString *)flag
{
    NSString *extraStr = [NSStringFromClass(class) stringByAppendingString:@"everLaunched"];
    extraStr = flag.length ? [extraStr stringByAppendingString:flag] : extraStr;
    NSString *versionStr = [[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"] stringByAppendingString:extraStr];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:versionStr]) {
        return NO;
    }else{
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:versionStr];
        return YES;
    }
}

@end
