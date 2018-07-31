//
//  HomeViewController.swift
//  Museo
//
//  Created by Victor Ciprian Burca on 11/04/2018.
//  Copyright © 2018 Victor Ciprian Burca. All rights reserved.
//

import UIKit
import FontAwesome_swift

class HomeViewController: UIViewController {
    
    @IBOutlet weak var imgItemOfTheDay: UIImageView!
    @IBOutlet weak var imgExploreAndPlay: UIImageView!
    @IBOutlet weak var imgLearnAndDiscover: UIImageView!
    @IBOutlet weak var labelItemOfTheDayDescription: UILabel!
    @IBOutlet weak var labelItemOfTheDay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imgLearnAndDiscover.image = UIImage.fontAwesomeIcon(name: .graduationCap, textColor: UIColor.darkGray, size: CGSize(width: 50, height: 50))
        imgExploreAndPlay.image = UIImage.fontAwesomeIcon(name: .image, textColor: UIColor.darkGray, size: CGSize(width: 50, height: 50))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func testButton(_ sender: Any) {
        let objectService =  MuseumObjectInfoService()
        
        objectService.getObjectInfo(for: "35456721") { (response) in
            print(response)
            if let imagesArray = response.value??.images {
               print(imagesArray)
            }
            
        }
    }
    
}
