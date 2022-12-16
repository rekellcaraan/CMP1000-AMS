//
//  ViewController.swift
//  CMP1000-AMS-IOS
//
//  Created by REKELL CARAAN on 2022-12-15.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var UsernameField: UITextField!
    
    @IBOutlet weak var UserpasswordField: UITextField!
    
    let amsCDContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBAction func TappedSignedInButton(_ sender: UIButton) throws {
        guard nil != UsernameField.text else {
            throw SignInError.InvalidUsername
        }
        let password = UserpasswordField.text!
        let username = UsernameField.text!
        do
        {
            try getCurrentSignedUserRole(userName: username, userPassword: password)
        }
        catch
        {
            print("Signin error!")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    enum SignInError : Error{
        case MismatchUsernameAndPassword
        case InvalidUsername
    }

    func getCurrentSignedUserRole(userName: String, userPassword: String) throws -> String
    {
        do
        {
            let users = try amsCDContext.fetch(Users.fetchRequest())
            
            guard users.count == 0 else{
                throw SignInError.MismatchUsernameAndPassword
            }
            
            for user in users
            {
                if user.username == userName && user.password == userPassword{
                    
                    break;
                }
            }
            
            throw SignInError.MismatchUsernameAndPassword
        }
        catch
        {
            throw SignInError.MismatchUsernameAndPassword
        }
    }
    
    func saveCurrentSignedUser(userName: String, userRole: String, userPassword: String)
    {
        let newUser = Users(context: amsCDContext)
        newUser.username = userName
        newUser.role = userRole
        newUser.password = userPassword
        
        do{
            try amsCDContext.save()
        }
        catch
        {
        }
            
    }
}

