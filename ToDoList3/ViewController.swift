//
//  ViewController.swift
//  ToDoList3
//
//  Created by user1 on 2016/10/31.
//  Copyright © 2016年 mycompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate {

    @IBOutlet weak var todolistTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if NSUserDefaults.standardUserDefaults().objectForKey("todoList") != nil {
            todoItem = NSUserDefaults.standardUserDefaults().objectForKey("todoList") as! [String]
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItem.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellValue = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        cellValue.textLabel?.text = todoItem[indexPath.row]
        return cellValue
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            todoItem.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(todoItem, forKey: "todoList")
            todolistTable.reloadData()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        todolistTable.reloadData()
    }
    
}

