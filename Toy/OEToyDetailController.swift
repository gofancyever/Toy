//
//  OEToyDetailController.swift
//  Toy
//
//  Created by gaooof on 2018/4/9.
//  Copyright © 2018年 gaof. All rights reserved.
//

import UIKit
import Reusable
import Hero
class OEToyDetailController: UITableViewController,StoryboardSceneBased {
    static let sceneStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    
    @IBOutlet weak var view_info: UIVisualEffectView!
    @IBOutlet weak var lab_title: UILabel!
    var indexPath:IndexPath?
    @IBOutlet weak var view_img: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        if let indexPath = self.indexPath {
            view_img.hero.id = "tpy_img_\(indexPath.item)"
            lab_title.hero.id = "toy_title_\(indexPath.item)"
            view_info.hero.id = "toy_info_\(indexPath.item)"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    

}
