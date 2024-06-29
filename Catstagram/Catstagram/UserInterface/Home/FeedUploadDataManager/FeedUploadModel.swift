//
//  FeedUploadModel.swift
//  Catstagram
//
//  Created by 김서윤 on 6/28/24.
//

struct FeedUploadModel : Decodable {
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : FeedUploadResult?
}

struct FeedUploadResult : Decodable {
    var postIdx : Int?
}
