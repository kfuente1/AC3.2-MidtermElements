//
//  ViewController.swift
//  AC3.2-MidtermElements
//
//  Created by Karen Fuentes on 12/8/16.
//  Copyright © 2016 Karen Fuentes. All rights reserved.
//

import UIKit

class ElementDetailViewController: UIViewController {
    var selectedElement: Element!

    
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var fullImageElement: UIImageView!
    @IBOutlet weak var elementInfo: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = selectedElement.name
        loadImage()
        loadinfo()
        
}
    
    @IBAction func postButtonWasTouched(_ sender: UIButton) {
        let postEndpoint = "https://api.fieldbook.com/v1/58488d40b3e2ba03002df662/favorites"
        
        APIRequestManager.manager.postRequest(endPoint: postEndpoint)
    
    }
    
    func loadinfo() {
        
    let symbolInfo = "Symbol: \(selectedElement.symbol),"
    let numberInfo = "Number: \(selectedElement.number),"
    let weighInfo = "Weight: \(selectedElement.weight),"
    let meltingInfo = "Melting Point: \(selectedElement.melting_c)"
    let boilingPoint = "Boiling Point: \(selectedElement.boiling_c)"
    self.elementInfo.text = "\(symbolInfo) \(numberInfo) \(weighInfo ) \(meltingInfo)\( boilingPoint)"
    }
    
    func loadImage() {
        
        var fullImageEndPoint = ""
        if let selectedElement = selectedElement {
              fullImageEndPoint = "https://s3.amazonaws.com/ac3.2-elements/\(selectedElement.symbol).png"
        }
        APIRequestManager.manager.getData(endPoint: fullImageEndPoint) { (data:Data?) in
            DispatchQueue.main.async {
                self.fullImageElement.image = UIImage(data: data!)
            }
        }
    }
    
 
}

