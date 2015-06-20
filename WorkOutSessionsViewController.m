//
//  WorkOutLogsViewController.m
//  
//
//  Created by Gamaliel Tellez on 6/1/15.
//
//

#import "WorkOutSessionsViewController.h"
#import "ModelController.h"
#import "AddExercisesVC.h"



@interface WorkOutSessionsViewController () 

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation WorkOutSessionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)addWorkOutSessionButtonTapped:(id)sender {
    
    UIAlertController *addSession = [UIAlertController alertControllerWithTitle:@"Add session Name" message:@"Please enter info" preferredStyle:UIAlertControllerStyleAlert];
    [addSession addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"enter session Name";
    }];
    
    [addSession addAction:[UIAlertAction actionWithTitle:@"Save session" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [[ModelController sharedInstance] createWorkoutSessionWithName:((UITextField *)addSession.textFields[0]).text withUser:[ModelController sharedInstance].user];
        [self.tableView reloadData];
    }]];
    [addSession addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        
        
    }]];
     
    [self presentViewController:addSession animated:YES completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toSessionDetail"]) {
        UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
        AddExercisesVC *vc = (AddExercisesVC *)navController.viewControllers[0];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        WorkoutSession *session = [ModelController sharedInstance].workoutSessionsArray[indexPath.row];
        vc.navigationItem.title = session.sessionName;
        vc.session = session;
    }
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self.tableView reloadData];
    
}





@end
















