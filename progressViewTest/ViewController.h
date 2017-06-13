//
//  ViewController.h
//  progressViewTest
//
//  Created by Talka_Ying on 2017/6/13.
//  Copyright © 2017年 Talka_Ying. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic,strong) IBOutlet UISegmentedControl* segmentedControl;
@property (nonatomic,strong) IBOutlet UIProgressView* progressView;
@property (nonatomic,strong) IBOutlet UIButton* startButton;
@property (nonatomic,strong) IBOutlet UIButton* clearButton;

@end
