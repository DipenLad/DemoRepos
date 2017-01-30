// ankit mehta
//  secondViewController.swift
//  SwiftDemo
//
//  Created by Dipen Lad on 8/22/16.
//  Copyright © 2016 Dipen Lad. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class secondViewController: UIViewController, UITableViewDelegate
{
    //let animals: [String] = ["Dog", "Cow" , "Goat", "Cat", "Camle"];
    var arrRes = [[String:AnyObject]]()
    
    let cellReuseIdentifier = "cell"
    @IBOutlet var tblAnimlse : UITableView!
    @IBOutlet weak var lblValue : UILabel!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        Alamofire.request(.GET, "http://api.androidhive.info/contacts/").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["contacts"].arrayObject {
                    self.arrRes = resData as! [[String:AnyObject]]
                }
                if self.arrRes.count > 0 {
                    self.tblAnimlse.reloadData()
                }
            }
        }
        
        self.tblAnimlse.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        tblAnimlse.delegate = self
        //tblAnimlse.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView : UITableView,numberOfRowsInSection:Int)->Int
    {
        return self.arrRes.count
    }
    
    func tableView(tableView: UITableView,cellForRowAtIndexPath indexPath: NSIndexPath)->UITableViewCell
    {
        let cell: UITableViewCell = self.tblAnimlse.dequeueReusableCellWithIdentifier(cellReuseIdentifier)as UITableViewCell!
        
        //cell.textLabel?.text = self.animals[indexPath.row]
        
        var dict = arrRes[indexPath.row]
        cell.textLabel?.text = dict["name"] as? String
        cell.detailTextLabel?.text = dict["email"] as? String
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        //lblValue.text = self.animals[indexPath.row]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
