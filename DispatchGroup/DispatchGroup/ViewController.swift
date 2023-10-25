//
//  ViewController.swift
//  DispatchGroup
//
//  Created by Sainath Bamen on 03/10/23.
//

import UIKit

class ViewController: UIViewController {
    var newModel = [Welcome]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
        
    }
    func fetchDataFromAPI(apiURL: URL, completion: @escaping (Data?, Error?) -> Void) { URLSession.shared.dataTask(with: apiURL)
    { (data, response, error) in completion(data, error) }
            .resume()
        
        
        
    }
    
    let apiUrl1 = URL(string: "https://reqres.in/api/users/2")!
    let apiUrl2 = URL(string: "http:")!
    let apiUrl3 = URL(string: "http:")!
    
    
    var responseData1: Data?
    var responseData2: Data?
    var responseData3: Data?
    
    func getData() {
        let groupQueue = DispatchGroup()
        // Enter the dispatch group before making each API call.
        groupQueue.enter()
        fetchDataFromAPI(apiURL: apiUrl2) { (data, error) in self.responseData2 = data
            groupQueue.leave()
            
        }
        
        groupQueue.enter()
        fetchDataFromAPI(apiURL: apiUrl2)
        { (data, error) in self.responseData2 = data
            groupQueue.leave() }
        
        groupQueue.enter()
        fetchDataFromAPI(apiURL: apiUrl3) { (data, error) in self.responseData3 = data
            groupQueue.leave() }
        
        // Notify when all API calls are completed
        groupQueue.notify(queue: .main) { // All API calls have completed here
            if let data1 = self.responseData1 {
            // Process data from the first API call
                print("Data from API 1: \(data1)")
                let json = try! JSONSerialization.jsonObject(with: data1)
                
            }
            
            if let data2 = self.responseData2 {
                print("Data from API 2: \(data2)")
            }
            
            if let data3 = self.responseData3 {
                print("Data from API 2: \(data3)")
            }
        }
        
        
    }

    
    
}
    
//extension ViewController: UITableViewDelegate, UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return DataClass.count
//
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
////        cell.myLbl.text = Welcome[indexPath.row]
//        cell.myLbl.text = DataClass[indexPath]
//        return cell
//
//    }
//
//
//}
