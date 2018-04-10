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
import SwiftyStarRatingView
import LLCycleScrollView
import Reusable
class OEToyDetailController: UITableViewController,StoryboardSceneBased {
    static let sceneStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    
    @IBOutlet weak var collectionView_related: UICollectionView!
    
    @IBOutlet weak var collectionView_community: UICollectionView!
    @IBOutlet weak var lab_year_title: UILabel!
    @IBOutlet weak var lab_year: UILabel!
    @IBOutlet weak var lab_grade: UILabel!
    @IBOutlet weak var grade: SwiftyStarRatingView!
    @IBOutlet weak var view_info: UIVisualEffectView!
    @IBOutlet weak var lab_title: UILabel!
    @IBOutlet weak var img_bg: UIImageView!
    var indexPath:IndexPath?
    let communityDelegate = CollectionViewCommunityDelegate()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInsetAdjustmentBehavior = .never
        if let indexPath = self.indexPath {
            img_bg.hero.id = "toy_img_\(indexPath.item)"
            lab_title.hero.id = "toy_title_\(indexPath.item)"
            view_info.hero.id = "toy_info_\(indexPath.item)"
            grade.hero.id = "toy_grade_\(indexPath.item)"
            lab_grade.hero.id = "toy_grade_title_\(indexPath.item)"
            lab_year_title.hero.id = "toy_year_title_\(indexPath.item)"
            lab_year.hero.id = "toy_year_\(indexPath.item)"
        }
        collectionView_related.delegate = self
        collectionView_related.dataSource = self
        collectionView_related.register(cellType: OEToolCell.self)
        collectionView_related.register(cellType: OERawCell.self)
        collectionView_related.backgroundColor = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.00)
        
        collectionView_community.backgroundColor = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.00)
        collectionView_community.delegate = communityDelegate
        collectionView_community.dataSource = communityDelegate
        collectionView_community.register(cellType: OECommunityCell.self)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
class CollectionViewCommunityDelegate:NSObject, UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath) as OECommunityCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 164, height: 186)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension OEToyDetailController:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(for: indexPath) as OERawCell
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(for: indexPath) as OEToolCell
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 242)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
