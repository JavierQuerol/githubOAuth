//
//  NewRepositoryViewController.swift
//  GoGoGithub
//
//  Created by Matthew Weintrub on 11/13/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import UIKit

class NewRepositoryViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    @IBOutlet weak var repoNameTextField: UITextField!
    @IBOutlet weak var createButton: UIBarButtonItem!
    @IBOutlet weak var repoDescriptionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        repoNameTextField.delegate = self
        
        // Enable the Save button only if the text field has a valid Meal name.
        checkValidRepoName()
    }
    
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        checkValidRepoName()
        navigationItem.title = textField.text
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        // Disable the Create button while editing.
        createButton.enabled = false
    }
    
    func checkValidRepoName() {
        // Disable the Create button if the text field is empty.
        let text = repoNameTextField.text ?? ""
        createButton.enabled = !text.isEmpty
    }
    
    
    
   //MARK: Post Request
    func repoPostRequest(name: String, description: String?) {
        
        do {
            let token = try MBGithubOAuth.shared.accessToken()
            guard let url = NSURL(string: "https://api.github.com/user/repos?access_token=\(token)") else {return}
            var parameters = [String : String]()
            parameters["name"] = name
            if let description = description {
                parameters["description"] = description
            }
            let request = NSMutableURLRequest(URL:url)
            let body = try! NSJSONSerialization.dataWithJSONObject(parameters, options: NSJSONWritingOptions.PrettyPrinted) as NSData
            request.HTTPBody = body
            request.HTTPMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
                if let error = error {
                    print(error)
                }
                if let data = data {
                    let request = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)
                    
                    
                }
                
            }).resume()
        }catch{}
        

    }
    
    //MARK: Navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        if createButton == sender {
//            let name = repositoryNameTextField.text ?? ""
//            let description = repositoryDescriptionTextField.text ?? ""
//        }
//       
//    }
    
    //MARK: Actions
    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)

    }
    @IBAction func repoPostRequestButtonPressed(sender: AnyObject) {
       
        
        repoPostRequest(repoNameTextField.text!, description: repoDescriptionTextField.text)
        
//        let alertController = UIAlertController(
//            title: "Success",
//            message: "We've create a new repo on github for you",
//            preferredStyle: UIAlertControllerStyle.Alert
//        )
//        
//        
//        let confirmAction = UIAlertAction(
//            title: "OK", style: UIAlertActionStyle.Default) { (action) in
//                // ...
//        }
//        
//        alertController.addAction(confirmAction)
//        
//        presentViewController(alertController, animated: true, completion: nil)
//    }
//        @IBAction func unwindToHomeViewController(sender: UIStoryboardSegue) {
//        
//            if let sourceViewController = sender.sourceViewController as? HomeViewController, repoNameTextField.text = !text.isEmpty {
//                
//            }
//        }
//        
        }
}



