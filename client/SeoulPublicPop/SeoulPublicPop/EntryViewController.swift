//
//  EntryViewController.swift
//  SeoulPublicPop
//  Modified by pacilo on 2015. 10. 27..
//
//  Created by Mic Pringle on 27/02/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class EntryViewController: UICollectionViewController {
    
    let categoryList = CategoryList.allCategory()
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let patternImage = UIImage(named: "Pattern") {
            view.backgroundColor = UIColor(patternImage: patternImage)
        }
        collectionView!.backgroundColor = UIColor.clearColor()
        collectionView!.decelerationRate = UIScrollViewDecelerationRateFast
        
        test()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func test()
    {
        //파라미터를 준비한다.
        let param = DataCenter.DataRequest("다목적실", local_pos: "중랑구", data_range: (limits: 30, offset: 60))
        
        //로드할 객체를 생성한다.
        let loader = DataLoader()
        
        //로드를 시작한다. 로드 완료 후 콜백 메소드를 호출한다. 현재 이는 클로저로 호출되고 있음
        loader.Start(param.req, resParam: param.res, startend: "info",callBack: { (output : [[String : AnyObject?]]?) -> () in
            for a in output!
            {
                //   아웃풋이 결과로 나옴 ex a["website"]! 로 접근하게되면 웹사이트에 관한 것들을 알 수 있음. 자세한 사항은 respondList참조
            }
            /*
            vec이라는 배열(모델)로 데이터를 관리하는 테이블 뷰에게 새로 가져온 데이터를 할당하고 유아이쓰레드로하여금 리로딩해야한다고 알려주는 부분이다.
            self.vec = output
            self.tableView.performSelectorOnMainThread(Selector("reloadData"), withObject: nil, waitUntilDone: true)
            */
        })
    }
}

extension EntryViewController {
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CategoryTableCell", forIndexPath: indexPath) as! CategoryTableCell
        cell.categoryList = categoryList[indexPath.item]
        return cell
    }
    
}
