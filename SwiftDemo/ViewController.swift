//
//  ViewController.swift
//  SwiftDemo
//
//  Created by Dipen Lad on 8/22/16.
//  Copyright © 2016 Dipen Lad. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var txtUserName : UITextField!
    @IBOutlet weak var lblValue : UILabel!
    @IBOutlet weak var btnSend : UIButton!
    @IBOutlet weak var btnNext : UIButton!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.lblValue.text = MySingleton.sharedInstance.strValue as String;
        
        
        Alamofire.request(.GET, "http://api.androidhive.info/contacts/").response { (req, res, data, error) -> Void in
            print(res)
            let outputString = NSString(data: data!, encoding:NSUTF8StringEncoding)
            print(outputString)
        }
        
        btnSend.addTarget(self, action: #selector(self.btnSendClicked(_:)), forControlEvents:  .TouchUpInside);
        btnNext.addTarget(self, action: #selector(self.btnNextClicked(_:)), forControlEvents:  .TouchUpInside);
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnSendClicked(sender : AnyObject)
    {
        
        txtUserName.resignFirstResponder();
        lblValue.text = txtUserName.text;
    }
    
    @IBAction func btnNextClicked(sender :AnyObject)
    {
        let NextVC = secondViewController(nibName: "secondViewController",bundle: nil)
        self.navigationController?.pushViewController(NextVC, animated: true)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

