//
//  PPCategoryAnnotation.swift
//  SeoulPublicPop
//
//  Created by 최윤호 on 2015. 10. 27..
//  Copyright © 2015년 DAYEONSSI. All rights reserved.
//

import UIKit
import MapKit

//카테고리의 타입. 추후 추가 구현 예정
enum CategoryType: Int {
    case CategoryDefault = 0
}

/*
    annotation 클래스. 이 클래스는 맵에 띄워줄 정보를 담는 역할을 한다.
*/
class AttractionAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D      //어노테이션을 띄워줄 위치
    var title :String?          //맵에서 메인으로 보여줄 타이틀 이름
    var subtitle :String?       //맵에서 메인 밑에서 조그마하게 보여줄 이름
    var type :CategoryType      //카테고리의 타입. 추후 추가 구현될 예정
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String, type: CategoryType) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.type = type
    }
}