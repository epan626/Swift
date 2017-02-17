//
//  ViewController.swift
//  starwars
//
//  Created by Eric Pan on 2/16/17.
//  Copyright © 2017 Eric Pan. All rights reserved.
//

import UIKit

class PeopleViewController: UITableViewController {


    var people = [NSDictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // specify the url that we will be sending the GET Request to
        let url = URL(string: "http://swapi.co/api/people/")
        // create a URLSession to handle the request tasks
        let session = URLSession.shared
        // create a "data task" to make the request and run the completion handler
        let task = session.dataTask(with: url!, completionHandler: {
            // see: Swift closure expression syntax
            data, response, error in
            do {
                // try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    
                    if let results = jsonResult["results"] {
                        // coercing the results object as an NSArray and then storing that in resultsArray
                        let resultsArray = results as! NSArray
                        // now we can run NSArray methods like count and firstObject
//                        print(resultsArray.count)
                        let resultx = resultsArray[0] as! NSDictionary
                        print(resultx["name"]!)
//                        self.people = resultsArray as! 
//                        print(self.people)
                        
//                        print(resultsArray.firstObject)
                    }
                }
            } catch {
                print(error)
            }
            // see: Swift nil coalescing operator (double questionmark)
            print(data ?? "no data") // the "no data" is a default value to use if data is nil
        })
        // execute the task and wait for the response before
        // running the completion handler. This is async!
        task.resume()
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // if we return - sections we won't have any sections to put our rows in
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the count of people in our data array
        return people.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create a generic cell
        let cell = UITableViewCell()
        // set the default cell label to the corresponding element in the people array
//        cell.textLabel?.text = people[indexPath.row] as String
        // return the cell so that it can be rendered
        return cell
    }


}

