//
//  Model.swift
//  Messagesapp
//
//  Created by Consultant on 8/2/22.
//

import Foundation
import MessageKit

//struct Message {
//    var content: String
//    var timestamp: String
//    var messageId: String
//    var userSenderId: Int
//}
//struct Message {
//    var content: String
//    var timestamp: String
//    var messageId: String
//    var userSenderId: Int
//}
//
//senderId: email,
//              displayName:
struct Sender : SenderType{
    var senderId: String
    
    var displayName: String
}
