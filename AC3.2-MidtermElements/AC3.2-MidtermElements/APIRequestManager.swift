//
//  APIRequestManager.swift
//  AC3.2-MidtermElements
//
//  Created by Karen Fuentes on 12/8/16.
//  Copyright © 2016 Karen Fuentes. All rights reserved.
//

import Foundation

class APIRequestManager {
    
    static let manager = APIRequestManager()
    private init() {}
    
    func getData(endPoint: String, callback: @escaping (Data?) -> Void) {
        guard let myURL = URL(string: endPoint) else { return }
        let session = URLSession(configuration: URLSessionConfiguration.default)
        session.dataTask(with: myURL) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                print("Error durring session: \(error)")
            }
            guard let validData = data else { return }
            callback(validData)
            }.resume()
    }
    
    func postRequest(endPoint: String) {
        guard let url = URL(string: endPoint) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Basic a2V5LTE6dHdwTFZPdm5IbEc2ajFBZndKOWI=", forHTTPHeaderField: "Authorization")
        
        // this is specifically for the midterm  -- don't change if you want to write there
        let data = self.getSerializedData()
        guard let validData = data else {return}
        request.httpBody = validData
        let session = URLSession(configuration: .default)
        session.dataTask(with: request) { (data: Data?, _, error: Error?) in
            if error != nil {
                print("Error!")
            }
            
            if data != nil {
                print("WE'VE GOT DATA \(data!)")
                
                do {
                    
                    let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any]
                    
                    if let validJson = json {
                        print(validJson)
                        
                    }
                    
                }
                catch {
                    print("Error encountered parsing: \(error)")
                }
            }
            
        }.resume()
    }
    func getSerializedData() -> Data? {
        let faveELementBody:[String:Any] = [
            "my_name" : "Karen Fuentes",
            "favorite_element" : "Potassium"
        ]
        
        do {
            let data = try JSONSerialization.data(withJSONObject: faveELementBody, options: [])
            
            print(data)
            return data
        }
        catch {
            print("Error serializing to Data: \(error)")
        }
        return nil
    }

}
