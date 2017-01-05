//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Walid Sassi on 05/01/2017.
//  Copyright © 2017 Walid Sassi. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // configure Coredata appdelegate and context variables
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        
        let newuser = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
        
        // add user data
        newuser.setValue("Imen", forKey: "login")
        newuser.setValue("mypass", forKey: "passwd")
        newuser.setValue(28, forKey: "age")
        do {
            try
            context.save()
            print ("saved")
            
        }
        catch {
            print("there was an error")
        }
        // restore data from coredata
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        request.returnsObjectsAsFaults = false
        do{
            let results = try context.fetch(request)
            if results.count > 0 {
                // show content of the User table
                for result in results as![NSManagedObject]{
                    if let login = result.value(forKey: "login") as? String{
                        print (login)
                    }
                }
                
            }else{
                print("No results")
            }
        }
        catch{
            print("there was an error")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

