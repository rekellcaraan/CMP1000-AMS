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
    
    @IBAction func TappedSignedInButton(_ sender: UIButton) {
        guard nil != UsernameField.text else {
            return
        }
        let password = UserpasswordField.text!
        let username = UsernameField.text!
        getCurrentSignedUserRole(userName: username, userPassword: password)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    func getCurrentSignedUserRole(userName: String, userPassword: String) -> String
    {
        do
        {
            let users = try amsCDContext.fetch(Users.fetchRequest())
        }
        catch
        {
            
        }
        
        return ""
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

