//
//  OEToyHomeController.swift
//  Toy
//
//  Created by gaof on 2018/4/9.
//  Copyright © 2018年 gaof. All rights reserved.
//

import UIKit
import Reusable
import SwiftyStarRatingView
import Hero
import IBAnimatable
class OEToyHomeController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var dataSource:[[String:String]] = {
        return [
            ["img":"timg","title":"犀牛"],
            ["img":"timg (1)","title":"千纸鹤"],
            ["img":"timg-1","title":"兔子"],
            ["img":"timg (2)","title":"鸡"],
            ["img":"1","title":"猪"],
        ]
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.contentInsetAdjustmentBehavior = .never
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = #colorLiteral(red: 0.8682318065, green: 0.8719339534, blue: 0.8351746739, alpha: 1)
        collectionView.register(cellType: OEToyHomeCell.self)
        collectionView.register(supplementaryViewType: OEToyHomeHerderView.self,
                                ofKind: UICollectionElementKindSectionHeader)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension OEToyHomeController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OEToyDetailNavController") as! UINavigationController
        let detailVC = viewVC.topViewController as! OEToyDetailController
        detailVC.indexPath = indexPath
        DispatchQueue.main.async {
            self.present(viewVC, animated: true, completion: nil)
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath) as OEToyHomeCell
        let data = self.dataSource[indexPath.row]
        cell.img_bg.image = UIImage(named:data["img"]!)
        cell.lab_title.text = data["title"]
        cell.grade.value = CGFloat(indexPath.row % 5)
        cell.lab_year.text = "\(indexPath.row % 12)"
        cell.indexPath = indexPath
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, for: indexPath) as OEToyHomeHerderView
        return header
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var num:CGFloat = 0
        if UIDevice.current.userInterfaceIdiom == .phone {
            num = 2
        }else{
            num = 4
        }
        
        return CGSize(width: collectionView.frame.width/num, height: collectionView.frame.width/num * 1.3)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: collectionView.frame.width * 0.75)
    }
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        let cell = collectionView.cellForItem(at: indexPath) as! OEToyHomeCell
        cell.animate(.scaleTo(x: 0.95, y: 0.95))
        
        return true
    }
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        print("didUnhighlightItemAt")
        let cell = collectionView.cellForItem(at: indexPath) as! OEToyHomeCell
        cell.animate(.scaleTo(x: 1, y: 1))
    }
}
