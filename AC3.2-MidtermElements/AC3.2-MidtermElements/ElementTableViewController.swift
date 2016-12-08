//
//  ElementTableViewController.swift
//  AC3.2-MidtermElements
//
//  Created by Karen Fuentes on 12/8/16.
//  Copyright © 2016 Karen Fuentes. All rights reserved.
//

import UIKit

class ElementTableViewController: UITableViewController {
    var allElements = [Element]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()

        
    }
    
    func getData() {
        
        APIRequestManager.manager.getData(endPoint: "https://api.fieldbook.com/v1/58488d40b3e2ba03002df662/elements") { (data: Data?) in
            if let validData = data{
                if let jsonData = try? JSONSerialization.jsonObject(with: validData, options: []) {
                    if let arrayDictofData = jsonData as? [[String:Any]] {
                        self.allElements = Element.parseElements(from: arrayDictofData)
                       // dump(self.allElements)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
            }
        }

    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.allElements.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ElementTBVCcell", for: indexPath) as! ElementsTableViewCell
        cell.elementInfo?.text = "\(allElements[indexPath.row].symbol)(\(allElements[indexPath.row].number)) \(allElements[indexPath.row].weight))"
        let imageEndPoint = "https://s3.amazonaws.com/ac3.2-elements/\(allElements[indexPath.row].symbol)_200.png"
        APIRequestManager.manager.getData(endPoint: imageEndPoint) { (data: Data?) in
            DispatchQueue.main.async {
                cell.elementImage.image = UIImage(data: data!)
                
            }
            cell.setNeedsLayout()
        }
        return cell
    }
 

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ElementDetailViewController,
        let cell = sender as? ElementsTableViewCell,
            let IndexPath = tableView.indexPath(for: cell) {
            destination.selectedElement = allElements[IndexPath.row]
        }

        
    }


}


















