//
//  ViewController.swift
//  MyWeatherApp
//
//  Created by MSP_DLF on 12/06/20.
//  Copyright © 2020 CTS. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class ViewController: UIViewController {

   
    @IBOutlet weak var country: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }


    @IBAction func findWeather(_ sender: Any)
    {
        print("Hello")
        let apikey = "/* your api key*/"
        //Handling Request
        Alamofire.request("https://api.openweathermap.org/data/2.5/weather?q=Portland&appid="+apikey).responseJSON(completionHandler: {
            response in
           
            let json = JSON(response.value ?? "no value")
            print(json)
        let temp = json["main"]["temp"].float
        let b = json["base"].string
        print(b ?? "no base")
        self.country.text = "Weather is " + (NSString(format: "%.2f", temp!) as String)
        })
    }
    
    
}

