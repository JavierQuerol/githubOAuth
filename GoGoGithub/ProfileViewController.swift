//
//  ProfileViewController.swift
//  GoGoGithub
//
//  Created by Matthew Weintrub on 11/13/15.
//  Copyright © 2015  Matthew Weintrub. All rights reserved.
//

import UIKit

let kUserName = "name"
let kUserLogin = "login"
let kUserURL = "url"
let kUserImageURL = "avatar_url"
let kUserFollowers = "followers"
let kUserFollowing = "following"
let kUserEmail = "email"


class ProfileViewController: UIViewController {
    
    //MARK: properties
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userLoginLabel: UILabel!
    @IBOutlet weak var userFollowersLabel: UILabel!
    @IBOutlet weak var userFollowingLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    
    
    
    //    var user: User? {
    //        didSet {
    //            setUpView()
    //        }
    //    }
    
    //MARK: Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: GET Request
    
    //    func fetchUser(data: NSData) -> User? {
    //        do {
    //            if let user = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as? [String:AnyObject] {
    //                if let userName = user[kUserNAme] as? String, , if let userLogin = user[kUserLogin] as? String, if let userURL = user[kUSErURL] as? String, if let userImageURL = user[kUserImageURL] as? String, if let userImageURL = user[kUserImageURL] as? String, if let userFollowers = user[kUserFollowers] as? Int, if let userFollowing = user[kUserFollowing] as? Int, if let userEmail = user[kUserEmail] as? String
    //                {
    //                    return User(name: userName, login: userLogin, url: userURL, imageURL: userImageURL, followers: userFollowers, following: userFollowing, email: userEmail)
    //                }
    //
    //            }
    //
    //        } catch {}
    //        return nil
    //    }
    
    
}












// MARK: Setup Functions

//    func setUpView() {
//        guard let user = self.user else { return }
//        self.userNameLabel.text = user.name
//        self.userLoginLabel.text = user.login
//        self.userFollowersLabel.text = "\(user.followers)"
//        self.userFollowingLabel.text = "\(user.following)"
//        self.userEmailLabel.text = user.email
//        if let imageURl = NSURL(string: user.avatarURL) {
//            let queue = NSOperationQueue()
//            queue.addOperationWithBlock { () -> Void in
//                guard let imageData = NSData(contentsOfURL: imageURl) else { return }
//                let image = UIImage(data: imageData)
//                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
//                    self.profileImageView.image = image
//                })
//            }
//        }
//    }

