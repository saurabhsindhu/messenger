//
//  NewsFeedViewController.m
//  messenger
//
//  Created by saurabh sindhu on 11/02/15.
//  Copyright (c) 2015 saurabh. All rights reserved.
//

#import "NewsFeedViewController.h"
#import "CustomTableViewCell.h"
#import "SWRevealTableViewCell.h"
#import "DAKeyboardControl.h"

#define kInputHeight 40.0f
#define kLineHeight 30.0f
#define kButtonWidth 78.0f



@interface NewsFeedViewController ()<SWRevealTableViewCellDelegate,SWRevealTableViewCellDataSource,UIActionSheetDelegate>
{
    NSIndexPath *_revealingCellIndexPath;
    NSInteger _sectionTitleRowCount;
}

@end

@implementation NewsFeedViewController

BOOL toggleIsOn;


typedef enum
{
    SectionTitle = 0,
    SectionImage,
    SectionsCount,
} Sections;


static NSString *RevealCellReuseIdentifier = @"RevealCellReuseIdentifier";

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)openLeft
{
    [SIDE_MENU_CONTROLLER openLeftSideViewControllerAnimated:YES completion:nil];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _sectionTitleRowCount = 4;

    [infoView setHidden:YES];
    
    toggleIsOn=YES;

}

-(IBAction)dialog:(id)sender{
    
    if(toggleIsOn){
        
        
        
        _paintView=[[UIView alloc]initWithFrame:CGRectMake(0, 45, 320, 560)];
        [_paintView setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:_paintView];
        
        
        UILabel *lbl2 = [[UILabel alloc] init];
        [lbl2 setFrame:CGRectMake(18.0f, 20.0f, 20, 20)];
        lbl2.backgroundColor=[UIColor clearColor];
        lbl2.textColor=[UIColor colorWithRed:184.0f/255.0f green:184.0f/255.0f blue:184.0f/255.0f alpha:1];
        lbl2.userInteractionEnabled=NO;
        lbl2.text= @"To";
        [lbl2 setFont:[UIFont systemFontOfSize:14]];
        //self.lbl1.textAlignment = NSTextAlignmentCenter;
        [_paintView addSubview:lbl2];
        
        
        UITextField* textF = [[UITextField alloc] initWithFrame:CGRectMake(50, 20, 180, 20)];
        
        
        textF.borderStyle = UITextBorderStyleNone;
        textF.textColor = [UIColor colorWithRed:184.0f/255.0f green:184.0f/255.0f blue:184.0f/255.0f alpha:1];
        textF.font = [UIFont systemFontOfSize:17];
        textF.placeholder = @"search name";
        textF.autocorrectionType = UITextAutocorrectionTypeNo;
        textF.keyboardType = UIKeyboardTypeDefault;
        textF.returnKeyType = UIReturnKeyDefault;
        textF.clearButtonMode = UITextFieldViewModeWhileEditing;
        textF.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textF.delegate = self;
        [_paintView addSubview:textF];
        
        
        // Input field
        
        UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f,
                                                                         self.view.bounds.size.height - 40.0f,
                                                                         self.view.bounds.size.width,
                                                                         40.0f)];
        toolBar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
        [self.view addSubview:toolBar];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10.0f,
                                                                               6.0f,
                                                                               toolBar.bounds.size.width - 68.0f,
                                                                               30.0f)];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [toolBar addSubview:textField];
        
        UIButton *sendButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        sendButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
        //[sendButton setTitle:@"Send" forState:UIControlStateNormal];
        [sendButton setBackgroundImage:[UIImage imageNamed:@"sent-btn"] forState:UIControlStateNormal];
        
        sendButton.frame = CGRectMake(toolBar.bounds.size.width - 48.0f,
                                      6.0f,
                                      46.0f,
                                      30.0f);
        [toolBar addSubview:sendButton];
        
        
        
        self.view.keyboardTriggerOffset = toolBar.bounds.size.height;
        
        [self.view addKeyboardPanningWithFrameBasedActionHandler:^(CGRect keyboardFrameInView, BOOL opening, BOOL closing) {
            /*
             Try not to call "self" inside this block (retain cycle).
             But if you do, make sure to remove DAKeyboardControl
             when you are done with the view controller by calling:
             [self.view removeKeyboardControl];
             */
            
            
            CGRect toolBarFrame = toolBar.frame;
            toolBarFrame.origin.y = keyboardFrameInView.origin.y - toolBarFrame.size.height;
            toolBar.frame = toolBarFrame;
            
            //CGRect tableViewFrame = tableView.frame;
           // tableViewFrame.size.height = toolBarFrame.origin.y;
           // tableView.frame = tableViewFrame;
        } constraintBasedActionHandler:nil];
        
    }
    else {
        
        
        [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
        
        _paintView.hidden=YES;
        
        
    }
    
    toggleIsOn = !toggleIsOn;

    
 
    
}

-(void)sendPressed2:(id)sender{
    
    
    
}



-(IBAction)butt1:(id)sender{
    
    [infoView setHidden:YES];
    
    [line1 setHidden:YES];
    
    [line2 setHidden:NO];
    
    conv.textColor = [UIColor colorWithRed:0/255.f green:123/255.f blue:168/255.f alpha:1];
    
    members.textColor = [UIColor colorWithRed:224/255.f green:224/255.f blue:224/255.f alpha:1];

    
}

-(IBAction)butt2:(id)sender{
    
    [infoView setHidden:NO];
    
    [line1 setHidden:NO];
    
    [line2 setHidden:YES];
    
    members.textColor = [UIColor colorWithRed:0/255.f green:123/255.f blue:168/255.f alpha:1];
    
    conv.textColor = [UIColor colorWithRed:224/255.f green:224/255.f blue:224/255.f alpha:1];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return SectionsCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
        return _sectionTitleRowCount;
   
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SWRevealTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:RevealCellReuseIdentifier];
    if ( cell == nil )
    {
        cell = [[SWRevealTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:RevealCellReuseIdentifier];
    }
    
    cell.delegate = self;
    cell.dataSource = self;
    
    if ( indexPath.section == SectionTitle)
    {
        cell.cellRevealMode = SWCellRevealModeReversedWithAction;
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    
    // Configure the cell...
  //  cell.detailTextLabel.text = @"Detail text";
    
//    cell.textLabel.text = [NSString stringWithFormat:@"My cell content %ld", (long)indexPath.section];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(45, 2, 250, 10)];
    
    titleLabel.tag = 234234;
    titleLabel.backgroundColor = [UIColor clearColor];
    
    titleLabel.textColor = [UIColor grayColor];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:8]];
   
    titleLabel.layer.shouldRasterize=YES;
    
    titleLabel.text = @"Alexender Wilson";
    [cell.contentView addSubview:titleLabel];
    
    UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(45, 15, cell.bounds.size.width-60, 15)];
    
    detailLabel.tag = 345345;
    detailLabel.backgroundColor = [UIColor clearColor];
    
    detailLabel.textColor = [UIColor blackColor];
    [detailLabel setFont:[UIFont boldSystemFontOfSize:11]];
    detailLabel.layer.shadowColor = [[UIColor whiteColor] CGColor];
    detailLabel.layer.shadowOpacity = 0.7;
    detailLabel.layer.shouldRasterize=YES;
    detailLabel.text = @"the text comes here";
    [cell.contentView addSubview:detailLabel];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.tag = 223;
    //set the position of the button
    button.frame = CGRectMake(cell.frame.origin.x + 60, cell.frame.origin.y + 35, 15, 13);
    [button setImage:[UIImage imageNamed:@"msg"] forState:UIControlStateNormal];
     [button addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor= [UIColor clearColor];
    [cell.contentView addSubview:button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.tag = 224;
    //set the position of the button
    button1.frame = CGRectMake(cell.frame.origin.x + 100, cell.frame.origin.y + 35, 15, 13);
    [button1 setImage:[UIImage imageNamed:@"like"] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(customActionPressed:) forControlEvents:UIControlEventTouchUpInside];
    button1.backgroundColor= [UIColor clearColor];
    [cell.contentView addSubview:button1];

    
    UIImageView *imgview = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 30, 35)];
    imgview.backgroundColor = [UIColor clearColor];
    imgview.layer.borderWidth = 1.0;
    imgview.userInteractionEnabled = NO;
    imgview.layer.cornerRadius =YES;
    [imgview setImage: [UIImage imageNamed:@"avatar"]];

    [cell.contentView addSubview:imgview];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 65;
    
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}


- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
}


//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // customize here the cell object before it is displayed.
//    
//    if ( indexPath.section == SectionTitle )
//    {
//        [cell setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:1]];
//        [cell.contentView setBackgroundColor:[UIColor clearColor]];
//    }
//    if ( indexPath.section == SectionImage )
//    {
//        [cell setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.5]];
//        [cell.contentView setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:1]];
//    }
//}
//

-(void)buttonTouched:(id)sender
{
    
    
//    if ([sender isSelected]) {
//        [sender setImage:[UIImage imageNamed:@"msg-dark.png"] forState:UIControlStateNormal];
//        [sender setSelected:NO];
//    } else {
//        [sender setImage:[UIImage imageNamed:@"msg.png"] forState:UIControlStateSelected];
//        [sender setSelected:YES];
//    }
    
}

#pragma mark - SWRevealTableViewCell delegate

- (void)revealTableViewCell:(SWRevealTableViewCell *)revealTableViewCell willMoveToPosition:(SWCellRevealPosition)position
{
    if ( position == SWCellRevealPositionCenter )
        return;
    
    for ( SWRevealTableViewCell *cell in [newsfeedTable visibleCells] )
    {
        if ( cell == revealTableViewCell )
            continue;
        
        [cell setRevealPosition:SWCellRevealPositionCenter animated:YES];
    }
}


- (void)revealTableViewCell:(SWRevealTableViewCell *)revealTableViewCell didMoveToPosition:(SWCellRevealPosition)position
{
    
}

-(void)customActionPressed:(UIButton*)button{
    
    switch (button.tag) {
        case 223:
            
            [button setBackgroundImage:[UIImage imageNamed:@"msg-dark"] forState:UIControlStateNormal];

            
            break;
        
        case 224:
            
            [button setBackgroundImage:[UIImage imageNamed:@"like-dark"] forState:UIControlStateNormal];
            


            break;

        default:
            break;
    }
    
}


#pragma mark - SWRevealTableViewCell data source

- (NSArray*)leftButtonItemsInRevealTableViewCell:(SWRevealTableViewCell *)revealTableViewCell
{
    SWCellButtonItem *item1 = [SWCellButtonItem itemWithTitle:@"Select" handler:^(SWCellButtonItem *item, SWRevealTableViewCell *cell)
                               {
                                   NSLog( @"Select Tapped");
                                   return YES;
                               }];
    
    item1.backgroundColor = [UIColor colorWithRed:0 green:0.5 blue:1 alpha:1];
    item1.tintColor = [UIColor whiteColor];
    item1.width = 50;
    
    SWCellButtonItem *item2 = [SWCellButtonItem itemWithTitle:@"Snap" handler:^(SWCellButtonItem *item, SWRevealTableViewCell *cell)
                               {
                                   NSLog( @"Snap Tapped");
                                   return YES;
                               }];
    
    item2.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:1];
    item2.image = [UIImage imageNamed:@"heart.png"];
    item2.width = 50;
    item2.tintColor = [UIColor whiteColor];
    
    NSLog( @"Providing left Items");
    return @[item1,item2];
}


- (NSArray*)rightButtonItemsInRevealTableViewCell:(SWRevealTableViewCell *)revealTableViewCell
{
    NSArray *items = nil;
    NSIndexPath *indexPath = [newsfeedTable indexPathForCell:revealTableViewCell];
    NSInteger section = indexPath.section;
    
    if ( section == SectionTitle )
    {
        SWCellButtonItem *item1 = [SWCellButtonItem itemWithTitle:@"Delete" handler:^(SWCellButtonItem *item, SWRevealTableViewCell *cell)
                                   {
                                       _revealingCellIndexPath = [newsfeedTable indexPathForCell:cell];
                                       [self presentDeleteActionSheetForItem:item];
                                       return NO;
                                   }];
        
        item1.backgroundColor = [UIColor redColor];
        item1.tintColor = [UIColor whiteColor];
        item1.width = 75;
        
        SWCellButtonItem *item2 = [SWCellButtonItem itemWithTitle:@"Edit" handler:^(SWCellButtonItem *item, SWRevealTableViewCell *cell)
                                   {
                                       _revealingCellIndexPath = [newsfeedTable indexPathForCell:cell];
                                       [self presentRenameActionSheetForItem:item];
                                       return NO;
                                   }];
        
        item2.backgroundColor = [UIColor blueColor];
        item2.tintColor = [UIColor colorWithRed:0.0f green:131.0f blue:174.0f alpha:1];
        item2.width = 60;
        
//        SWCellButtonItem *item3 = [SWCellButtonItem itemWithTitle:@"More" handler:^(SWCellButtonItem *item, SWRevealTableViewCell *cell)
//                                   {
//                                       _revealingCellIndexPath = [newsfeedTable indexPathForCell:cell];
//                                       [self presentMoreActionSheetForItem:item];
//                                       return NO;
//                                   }];
//        
//        item3.backgroundColor = [UIColor lightGrayColor];
//        item3.width = 50;
        
        items = @[item1,item2];
    }
    
    else if ( section == SectionImage )
    {
        SWCellButtonItem *item1 = [SWCellButtonItem itemWithImage:[UIImage imageNamed:@"star.png"] handler:^(SWCellButtonItem *item, SWRevealTableViewCell *cell)
                                   {
                                       NSLog( @"Star Tapped");
                                       return YES;
                                   }];
        
        item1.backgroundColor = [UIColor orangeColor];
        item1.backgroundColor = [UIColor colorWithRed:1 green:0.5 blue:0 alpha:0.5];
        item1.tintColor = [UIColor whiteColor];
        item1.width = 50;
        
        SWCellButtonItem *item2 = [SWCellButtonItem itemWithImage:[UIImage imageNamed:@"heart.png"] handler:^(SWCellButtonItem *item, SWRevealTableViewCell *cell)
                                   {
                                       NSLog( @"Heart Tapped");
                                       return YES;
                                   }];
        
        item2.backgroundColor = [UIColor colorWithWhite:1 alpha:0.33]; //[UIColor darkGrayColor];
        item2.tintColor = [UIColor redColor];
        item2.width = 50;
        
        SWCellButtonItem *item3 = [SWCellButtonItem itemWithImage:[UIImage imageNamed:@"airplane.png"] handler:^(SWCellButtonItem *item, SWRevealTableViewCell *cell)
                                   {
                                       NSLog( @"Airplane Tapped");
                                       return YES;
                                   }];
        
        item3.backgroundColor = [UIColor colorWithWhite:1 alpha:0.66]; //[UIColor lightGrayColor];
        item3.width = 50;
        
        items = @[item1,item2,item3];
    }
    
    NSLog( @"Providing right Items");
    return items;
}


#pragma mark - ButtonItemAdd action

- (void)buttonItemAddAction:(id)sender
{
    NSIndexPath *insertingPath = [NSIndexPath indexPathForRow:0 inSection:SectionTitle];
    _sectionTitleRowCount += 1;
    
    [newsfeedTable insertRowsAtIndexPaths:@[insertingPath] withRowAnimation:UITableViewRowAnimationFade];
}


#pragma mark - UIActionSheet


- (void)presentDeleteActionSheetForItem:(SWCellButtonItem*)cellItem
{
//    UIActionSheet *actSheet = [[UIActionSheet alloc] initWithTitle:@"Delete Actions"
//                                                          delegate:self
//                                                 cancelButtonTitle:@"Cancel"
//                                            destructiveButtonTitle:@"Delete Now"
//                                                 otherButtonTitles:nil ];
//    
//    [actSheet setTag:0];
//    [actSheet showFromCellButtonItem:cellItem animated:YES];
}


- (void)_performDeleteAction
{
    _sectionTitleRowCount -= 1;
    [newsfeedTable deleteRowsAtIndexPaths:@[_revealingCellIndexPath] withRowAnimation:UITableViewRowAnimationFade];
}


- (void)presentRenameActionSheetForItem:(SWCellButtonItem*)cellItem
{
//    UIActionSheet *actSheet = [[UIActionSheet alloc] initWithTitle:@"More Actions"
//                                                          delegate:self
//                                                 cancelButtonTitle:@"Cancel"
//                                            destructiveButtonTitle:nil
//                                                 otherButtonTitles:@"Action Rename", nil ];
//    
//    [actSheet setTag:1];
//    [actSheet showFromCellButtonItem:cellItem animated:YES];
}


- (void)_performRenameAction
{
    NSLog( @"Rename Tapped");
}


- (void)presentMoreActionSheetForItem:(SWCellButtonItem*)cellItem
{
//    UIActionSheet *actSheet = [[UIActionSheet alloc] initWithTitle:@"More Actions"
//                                                          delegate:self
//                                                 cancelButtonTitle:@"Cancel"
//                                            destructiveButtonTitle:nil
//                                                 otherButtonTitles:@"Action One", @"Action Two", @"Action Three", nil ];
//    
//    [actSheet setTag:2];
//    [actSheet showFromCellButtonItem:cellItem animated:YES];
}


- (void)_performMoreActionAtIndex:(NSInteger)index
{
    switch ( index )
    {
        case 0:
            NSLog( @" Action One Tapped");
            break;
            
        case 1:
            NSLog( @" Action Two Tapped");
            break;
            
        case 2:
            NSLog( @" Action Three Tapped");
            break;
            
        default:
            break;
    }
}


// UIActionSheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //NSLog( @"clickedButtonAtIndex: %d", buttonIndex );
    
    if ( buttonIndex == [actionSheet cancelButtonIndex] )
    {
        NSLog( @"Cancel");
    }
    else
    {
        NSInteger index = buttonIndex - actionSheet.firstOtherButtonIndex;
        
        switch ( actionSheet.tag )
        {
            case 0:  // delete
                [self _performDeleteAction];
                break;
                
            case 1:  // rename
                [self _performRenameAction];
                break;
                
            case 2:  // more
                [self _performMoreActionAtIndex:index];
                break;
                
            default:
                break;
        }
    }
    
    SWRevealTableViewCell *cell = (id)[newsfeedTable cellForRowAtIndexPath:_revealingCellIndexPath];
    [cell setRevealPosition:SWCellRevealPositionCenter animated:YES];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
