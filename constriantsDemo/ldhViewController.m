//
//  ldhViewController.m
//  constriantsDemo
//
//  Created by LDH on 14/11/20.
//  Copyright (c) 2014年 LDH. All rights reserved.
//

#import "ldhViewController.h"

@interface ldhViewController ()

@end

@implementation ldhViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imageView.image = [UIImage imageNamed:@"1.jpg"];
    [self addConstraints];
}

- (void)addConstraints {
    
    // remove default property of constraints
    [self.view removeConstraints:self.view.constraints];
    
    UILabel *titleOne = self.titleOne;
    UILabel *titleTwo = self.titleTwo;
    UIImageView *imageView = self.imageView;
    UITextView *textView = self.textView;
    
    // use marco to make our variables to an dictionary
    NSDictionary *views = NSDictionaryOfVariableBindings(titleOne, titleTwo, imageView, textView);
    
    NSDictionary *metrics = @{@"pixel":@100.0, @"width": @150.0, @"horizontalSpacing":@15.0, @"vert":@10.0};
    
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:
                            @"|-[imageView(pixel)]-horizontalSpacing-[titleOne(>=width)]-|"
                                                                   options:0
                                                                   metrics:metrics
                                                                     views:views];
    
    constraints = [constraints arrayByAddingObjectsFromArray:
                   [NSLayoutConstraint constraintsWithVisualFormat:
                    @"|-[imageView]-horizontalSpacing-[titleTwo(>=width)]-|"
                                                           options:0
                                                           metrics:metrics
                                                             views:views]];
    
    constraints = [constraints arrayByAddingObjectsFromArray:
                   [NSLayoutConstraint constraintsWithVisualFormat:
                    @"|-[imageView]-horizontalSpacing-[textView(>=width)]-|"
                                                           options:NSLayoutFormatAlignAllBottom
                                                           metrics:metrics
                                                             views:views]];
    constraints = [constraints arrayByAddingObjectsFromArray:
                   [NSLayoutConstraint constraintsWithVisualFormat:
                    @"V:|-30-[imageView(pixel)]"
                                                           options:0
                                                           metrics:metrics
                                                             views:views]];
    constraints = [constraints arrayByAddingObjectsFromArray:
                   [NSLayoutConstraint constraintsWithVisualFormat:
                    @"V:|-30-[titleOne]-vert-[titleTwo]-vert-[textView]"
                                                           options:0
                                                           metrics:metrics
                                                             views:views]];
    
    [self.view addConstraints:constraints];
    
    
}

@end
