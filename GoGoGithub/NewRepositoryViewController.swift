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
    @IBOutlet weak var repositoryNameTextField: UITextField!
    @IBOutlet weak var createButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        repositoryNameTextField.delegate = self
        
        
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
        // Disable the Save button while editing.
        createButton.enabled = false
    }
    
    func checkValidRepoName() {
        // Disable the Save button if the text field is empty.
        let text = repositoryNameTextField.text ?? ""
        createButton.enabled = !text.isEmpty
    }
    
    
    
   //MARK: Post Request
    func repoPostRequest(name: String) {
        
        do {
            let token = try MBGithubOAuth.shared.accessToken()
            guard let url = NSURL(string: "https://api.github.com/user/repos?access_token=\(token)") else {return}
            print(url)
            var parameters = [String : String]()
            parameters["name"] = name
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
    }
    
    //MARK: Actions
    @IBAction func repoPostRequestButtonPressed(sender: AnyObject) {
        repoPostRequest(repositoryNameTextField.text!)
    }
}



