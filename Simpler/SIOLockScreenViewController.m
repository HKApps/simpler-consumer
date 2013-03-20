//
//  JSLockScreenViewController.m
//  JSLockScreen
//
//  Copyright (c) 2011, James Addyman, JamSoft All rights reserved.
//	
//	Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//	
//	Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
//	Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
//	Neither the name of the nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
//	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
//	FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
//	BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
//	STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

#import "SIOLockScreenViewController.h"
#import "JSLockScreenViewController.h"
#import "SIOAppDelegate.h"
#import "User+SIO.h"

@implementation SIOLockScreenViewController


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
	//[self setStatusLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)unlock:(id)sender
{
	_lockScreenViewController = [[JSLockScreenViewController alloc] initWithDelegate:self];
	UIWindow *window = [(SIOAppDelegate *)[[UIApplication sharedApplication] delegate] window];
    _lockScreenViewController.savedPasscode =  [(User*) [User getCurrentUserInContext:[(SIOAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext]] passcode];
	[_lockScreenViewController showInWindow:window];
}

-(IBAction)lock:(id)sender {
    if(![_lockCode.text length]){
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Passcode is empty" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    if(![_lockCode.text isEqualToString:_lockCodeConfirm.text]){
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"The passcodes do not match" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    
    User * user = (User*) [User getCurrentUserInContext:[(SIOAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext]];
    user.passcode = _lockCode.text;
    
    _lockScreenViewController = [[JSLockScreenViewController alloc] initWithDelegate:self];
	UIWindow *window = [(SIOAppDelegate *)[[UIApplication sharedApplication] delegate] window];
    _lockScreenViewController.savedPasscode =  user.passcode;
	[_lockScreenViewController showInWindow:window];
    
    self.view = _lockedView;
}

-(IBAction)doneEditing:(id)sender {
    [_lockCode resignFirstResponder];
    [_lockCodeConfirm resignFirstResponder];

}



- (void)lockScreenDidUnlock:(JSLockScreenViewController *)lockScreen
{
    self.view = _mainView;
}

- (void)lockScreenFailedUnlock:(JSLockScreenViewController *)lockScreen
{
	//[self.statusLabel setText:@"Failure!"];
}

- (void)lockScreenDidCancel:(JSLockScreenViewController *)lockScreen
{
	//[self.statusLabel setText:@"Cancelled"];
}

- (void)lockScreenDidDismiss:(JSLockScreenViewController *)lockScreen
{
	_lockScreenViewController = nil;
}


#pragma mark UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
 
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    return (newLength > 4) ? NO : YES;
    
}


@end
