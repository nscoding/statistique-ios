//
//  SQMemoryHelper.m
//  Statistique
//
//  Created by Patrick on 4/20/13.
//  Copyright (c) 2013 Patrick Chamelo - nscoding. All rights reserved.
//

#import "SQMemoryHelper.h"
#import <mach/mach.h>
#import <mach/mach_host.h>
#include <sys/types.h>
#include <sys/sysctl.h>
#include <stdio.h>
#include <stdlib.h>


// ------------------------------------------------------------------------------------------


@implementation SQMemoryHelper


+ (NSUInteger)memoryForOption:(SQMemoryOption)option
{
    mach_port_t host_port;
    mach_msg_type_number_t host_size;
    vm_size_t pagesize;
    
    host_port = mach_host_self();
    host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    host_page_size(host_port, &pagesize);
	
    vm_statistics_data_t vm_stat;
	
    if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS)
        NSLog(@"Failed to fetch vm statistics");
	
    natural_t count;
    
    switch (option)
    {
        case SQMemoryOptionFree:
        {
            count = vm_stat.free_count;
        }
            break;
        case SQMemoryOptionInactive:
        {
            count = vm_stat.inactive_count;
        }
            break;
        case SQMemoryOptionActive:
        {
            count = vm_stat.active_count;
        }
            break;
        case SQMemoryOptionWired:
        {
            count = vm_stat.wire_count;
        }
            break;
        case SQMemoryOptionAll:
        {
            count = vm_stat.free_count + vm_stat.inactive_count +
                    vm_stat.active_count + vm_stat.wire_count;
        }
            break;
    }

	return ((NSUInteger) count * pagesize);
}


+ (NSString *)stringMemoryForOption:(SQMemoryOption)option
{
    return [NSString stringWithFormat:@"%.2u MB", [SQMemoryHelper memoryForOption:option] / 1024 / 1024];
}


+ (NSString *)stringHeaderForOption:(SQMemoryOption)option
{
    switch (option)
    {
        case SQMemoryOptionFree:
        {
            return NSLocalizedString(@"Free", @"");
        }
            break;
        case SQMemoryOptionInactive:
        {
            return NSLocalizedString(@"Inactive", @"");
        }
            break;
        case SQMemoryOptionActive:
        {
            return NSLocalizedString(@"Active", @"");
        }
            break;
        case SQMemoryOptionWired:
        {
            return NSLocalizedString(@"Wired", @"");
        }
            break;
        case SQMemoryOptionAll:
        {
            return NSLocalizedString(@"All", @"");
        }
            break;
    }
}

@end
