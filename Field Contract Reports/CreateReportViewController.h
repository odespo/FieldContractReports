//
//  CreateReportViewController.h
//  Field Contract Reports
//
//  Created by Orion Despo on 8/14/13.
//  Copyright (c) 2013 Orion Despo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateReportViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>

//set up views
@property (nonatomic,retain) UIView *finaloptionview;
@property (nonatomic,retain) UIView *salesquarterview;
@property (nonatomic,retain) UIView *territoryview;
@property (nonatomic,retain) UIView *compassview;
@property (nonatomic,retain) UIView *customermarketknowledgeview;
@property (nonatomic,retain) UIView *sellingskillview;

//tool bars, pickers, etc.
@property (nonatomic,retain) UIToolbar *toolbar;
@property (nonatomic,retain) UIPickerView *rankpicker;
@property (nonatomic,retain) UIDatePicker *datepicker;
@property (nonatomic,retain) UIPickerView *contactpicker;

//textfields and textviews
@property (nonatomic,retain) UITextField *repname;
@property (nonatomic,retain) UITextField *visitdate;
@property (nonatomic,retain) UITextField *visitlocation;
@property (nonatomic,retain) UITextField *territoryrank;
@property (nonatomic,retain) UITextField *compassrank;
@property (nonatomic,retain) UITextField *customermarketknowrank;
@property (nonatomic,retain) UITextField *sellskilsrank;


@property (nonatomic,retain) UITextView *pendingreferralstext;
@property (nonatomic,retain) UITextView *territyplanningtext;
@property (nonatomic,retain) UITextView *compasstext;
@property (nonatomic,retain) UITextView *customermarketknowtext;
@property (nonatomic,retain) UITextView *sellskillstext;
@property (nonatomic,retain) UITextView *forwardactionstext;

//labels
@property (nonatomic,retain) UILabel *terrlabel;
@property (nonatomic,retain) UILabel *terrextralabel;
@property (nonatomic,retain) UILabel *complabel;
@property (nonatomic,retain) UILabel *compextralabel;
@property (nonatomic,retain) UILabel *customerlabel;
@property (nonatomic,retain) UILabel *customerextralabel;
@property (nonatomic,retain) UILabel *selllabel;
@property (nonatomic,retain) UILabel *sellextralabel;
@property (nonatomic,retain) UILabel *forwardlabel;

@property (nonatomic,retain) UILabel *replabel;
@property (nonatomic,retain) UILabel *rmlabel;
@property (nonatomic,retain) UILabel *visitlabel;
@property (nonatomic,retain) UILabel *locationlabel;

@property (nonatomic,retain) UILabel *terrranklabel;
@property (nonatomic,retain) UILabel *compranklabel;
@property (nonatomic,retain) UILabel *customerranklabel;
@property (nonatomic,retain) UILabel *sellranklabel;





@end
