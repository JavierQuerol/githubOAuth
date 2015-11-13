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
    func repoPostRequest(name: String, description: String?, completion: (error: String?) -> () ) {
        
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
                
                print(response)
                
                guard let response = response else {return completion(error: "No response.")}
                guard let httpResponse = response as? NSHTTPURLResponse else { return completion(error: "Failed to upcast to NSHTTPURLResponse.")}
                
                if httpResponse.statusCode == 201 {
                    completion(error: nil)
                }
                
            }).resume()
        }catch let error {
            completion(error: "Error getting a token. \(error)")
        }
        

    }
    
    //MARK: Navigation
    
    //MARK: Actions
    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)

    }
    
    @IBAction func repoPostRequestButtonPressed(sender: AnyObject) {
                repoPostRequest(repoNameTextField.text!, description: repoDescriptionTextField.text ) { (error) -> () in
                    
                    if error == nil {
                    self.dismissViewControllerAnimated(true, completion: nil)
            
                    }
            }
        }
}





