//
//  ViewController.m
//  Array
//
//  Created by User on 4/15/18.
//  Copyright © 2018 Big Nerd Ranch. All rights reserved.
//

#import "ViewController.h"
@interface MyObject: NSObject
@end

@implementation MyObject
@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Create NSArray, containing several strings, using literal declaration.
    NSArray *strings = @[@"1", @"2", @"3", @"4", @"$"];
    
    //Create mutable array from piviously created NSArray.
    NSMutableArray *mutStrings = [NSMutableArray arrayWithArray:strings];//1
    
    //Create an empty array and obtain its first and last element in a safe way.
    NSArray *empty = [NSArray array];
    NSLog(@"%@, %@", [empty firstObject], [empty lastObject]);
    
    
    //Create NSArray, containing strings from 1 to 20
    NSArray *stringsFrom1To20 = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20", nil];
    
    //Got its shallow copy
    NSArray *shallowCopyForStrings = [stringsFrom1To20 copyWithZone:nil];
    
    //Got its 1 level deep Copy
    NSArray *oneLevelDeepCopyForStringsArr = [[NSArray alloc] initWithArray:stringsFrom1To20 copyItems:YES];
    
    
    //Got its true deep Copy
    NSArray *trueDeepCopyForStrings = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:stringsFrom1To20]];
    
    //Got the element at index 13.
    for(int i = 0; i < [trueDeepCopyForStrings count]; i++) {
        if(i == 13) {
            NSLog(@"%@", trueDeepCopyForStrings[i]);
        }
    }
    
    //Make stringsFrom1To20 mutable.
    NSMutableArray *mutStringsFrom1To20 = [stringsFrom1To20 mutableCopy];
    if([mutStringsFrom1To20 isKindOfClass: [NSArray class]]) {
        NSLog(@"YES");
    } else {
        NSLog(@"NO");
    }
    //Added several ilements to the end and to the beginning.
    [mutStringsFrom1To20 addObject:@"I Added you"];
    [mutStringsFrom1To20 addObject:@"I ADDED YOU"];
    [mutStringsFrom1To20 insertObject:@"I Added you" atIndex:0];
    
    //Iterated over an array and removed element at index 5
    for(int i = 0; i < [mutStringsFrom1To20 count]; i++) {
        if(i == 5) {
            [mutStringsFrom1To20 removeObjectAtIndex:i];
        }
    }
    //Array with mixed numbers
    NSMutableArray *numbers = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInteger:4],[NSNumber numberWithInteger:2],[NSNumber numberWithInteger:9],[NSNumber numberWithInteger:3], nil];
    
    //Sorted array with sortUsingComparator method:
    [numbers sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if(obj1 < obj2) {
            return (NSComparisonResult)NSOrderedDescending;
        } else {
            return 0;
        }
    }];
    NSLog(@"%@", numbers);
    
    
    NSLog(@"\nstrings = %lu\nmutStrings = %d\nempty = %d\nstringsFrom1To20 = %d\nshallowCopyForStrings = %d\noneLevelDeepCopy = %d\ntrueDeepCopyForStrings = %d\nmutStringsFrom1To20 = %d\nnumbers = %d", [strings retainCount], [mutStrings retainCount], [empty retainCount], [stringsFrom1To20 retainCount], [shallowCopyForStrings retainCount], [oneLevelDeepCopyForStringsArr retainCount], [trueDeepCopyForStrings retainCount], [mutStringsFrom1To20 retainCount], [numbers retainCount]);
    
    //Releasing the objects
    [shallowCopyForStrings release];
    [oneLevelDeepCopyForStringsArr release];
    [mutStringsFrom1To20 release];
    [numbers release];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
