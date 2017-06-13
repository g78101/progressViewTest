//
//  ViewController.m
//  progressViewTest
//
//  Created by Talka_Ying on 2017/6/13.
//  Copyright © 2017年 Talka_Ying. All rights reserved.
//

#import "ViewController.h"

#define totalCount 10

typedef enum : NSUInteger {
    MODE_MAIN_THREAD=0,
    MODE_SELECTOR_BACKGROUND,
    MODE_DISPATCH_ASYNC,
} ThreadMode;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_startButton addTarget:self action:@selector(startButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_clearButton addTarget:self action:@selector(clearButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) startButtonClicked:(UIButton*) sender {

    _progressView.progress = 0;

    for(int i=0;i<=totalCount;++i) {
        
        [NSThread sleepForTimeInterval:0.1];
        
        NSNumber *num = [NSNumber numberWithFloat:(float)i/totalCount];
        switch (_segmentedControl.selectedSegmentIndex) {
            case MODE_MAIN_THREAD:
                [self updateValue:num];
                break;
            case MODE_SELECTOR_BACKGROUND:
                [self performSelectorInBackground:@selector(updateValue:) withObject:num];
                break;
            case MODE_DISPATCH_ASYNC:
            {
                __weak typeof(self) weakSelf = self;
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
                    [weakSelf updateValue:num];
                });
            }   break;
        }
    }
}

- (void) clearButtonClicked:(UIButton*) sender {
    _progressView.progress = 0;
}

- (void) updateValue:(NSNumber *) num {
    NSLog(@"%@",num);
    [_progressView setProgress:[num floatValue]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
