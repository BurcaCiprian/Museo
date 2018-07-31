//
//  ViewController.swift
//  Museo
//
//  Created by Victor Ciprian Burca on 05/04/2018.
//  Copyright © 2018 Victor Ciprian Burca. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func testButton(_ sender: Any) {
        print("test")
        let objectService =  MuseumObjectInfoService()
        objectService.getObjectInfo(for: "35456721") { (response) in
            print(response)
        }
        
        objectService.getRandomObjectInfo(hasImage: "1") { (response) in
            print(response)
        }
        
    }
    
}

