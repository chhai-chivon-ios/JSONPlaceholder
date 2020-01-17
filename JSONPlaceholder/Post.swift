//
//  Post.swift
//  JSONPlaceholder
//
//  Created by Chhai Chivon on 1/17/20.
//  Copyright © 2020 Chhai Chivon. All rights reserved.
//

import Foundation

struct Post :  Decodable {
    
    let userId : Int
    let id : Int
    let title : String
    let body : String
    
}
