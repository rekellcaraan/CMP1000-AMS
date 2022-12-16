//
//  ViewController.swift
//  CMP1000-AMS-IOS
//
//  Created by REKELL CARAAN on 2022-12-15.
//

import UIKit

class ViewController: UIViewController {

    let amsCDContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func getCurrentSignedUserRole(userName: String) -> String
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

