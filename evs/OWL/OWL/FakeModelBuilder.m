//
//  FakeModelBuilder.m
//  Example
//
//  Created by Robert Nash on 19/09/2015.
//  Copyright © 2015 Robert Nash. All rights reserved.
//

#import "FakeModelBuilder.h"

@implementation FakeModelBuilder

+(NSArray *)buildMenu
{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *arrayOfImages = [userDefaults objectForKey:@"keyDataFaq"];
    
    
    
    NSMutableArray *collector = [NSMutableArray new];
    
    for (int i = 0; i < [arrayOfImages count]; i++)
    {
        MenuSection *section = [MenuSection new];
        
        section.title=[NSString stringWithFormat:@"%@",[[arrayOfImages objectAtIndex:i] objectForKey:@"question"]];
        
        section.items = @[[NSString stringWithFormat:@"%@",[[arrayOfImages objectAtIndex:i] objectForKey:@"answer"]]];
        
        [collector addObject:section];
    }
    return [collector copy];
}

@end
