//
//  ViewController.swift
//  Todo
//
//  Created by R Unnikrishnan on 16/08/24.
//

import UIKit

class ViewController: UITableViewController
{
 
    var textArray = ["Todo One","Todo Two","Todo Three"]
    let defaultData = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let todo = defaultData.array(forKey: "ToDoListArray") as? [String]
        {
            textArray = todo
        }
    }
    //MARK: tableView Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todoCell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath) as! toDoCell
        todoCell.todoListLabel.text = textArray[indexPath.row]
        return todoCell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) 
    {
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: add todo Button Action
    @IBAction func addTodoAction(_ sender: UIBarButtonItem)
    {
        var textField = UITextField()
        let toDoAlert = UIAlertController(title: "Create Todo List", message: "", preferredStyle: .alert)
        let toDoAlertAction = UIAlertAction(title: "Add To List", style: .default) 
        { [self] toAction in
            if textField.text?.isEmpty == false
            {
                textArray.append(textField.text!)
                defaultData.set(textArray, forKey: "ToDoListArray")
                
                tableView.reloadData()
            }
            else
            {
                print("No Creation")
            }
            
        }
        toDoAlert.addTextField { todoTextField in
            todoTextField.placeholder = "Create New List"
            textField = todoTextField
        }
        toDoAlert.addAction(toDoAlertAction)
        present(toDoAlert, animated: true)
    }
}

