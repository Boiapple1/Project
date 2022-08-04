//
//  ChatViewController.swift
//  Messagesapp
//
//  Created by Consultant on 8/3/22.
//

import UIKit
import MessageKit
import BaronTalk
import FirebaseAuth
import InputBarAccessoryView

struct mesa: MessageType{
    var sender: SenderType
    
    var messageId: String
    
    var sentDate: Date
    
    var kind: MessageKind
    
    
}
struct receiver: SenderType{
    var senderId: String
    
    var displayName: String
    
    
}

class ChatViewController: MessagesViewController {
    private var messa = [mesa]()
    private var messages = [Message]()
    public var conversations: [Message] = []
    var messagess =  BaronTalk.MessagesController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        messageInputBar.delegate = self
        
        view.backgroundColor = .white
        title = "Messages"

    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        messageInputBar.inputTextView.becomeFirstResponder()
        listenForMessages(shouldScrollToBottom: true)
       
    }
    var selfSender: Sender? {
        guard let email = UserDefaults.standard.value(forKey: "email") as? String else {
            return nil
        }
        

        return Sender(senderId: email, displayName: "Me")
    }
 
    

    
    private func listenForMessages(shouldScrollToBottom: Bool) {
        self.messagess.getContent(completion: { [weak self] result in
            switch result {
            case .success(let messages):
                print("success in getting messages: \(messages)")
                guard !messages.isEmpty else {
                    print("messages are empty")
                    return
                }
                self?.messages = messages
                
                for mes in messages {
                    
                    self?.messa.append(mesa(sender: receiver(senderId: mes.userSenderId, displayName: "someone"), messageId: mes.messageId, sentDate: Date(), kind: .text("\(mes.userSenderId)\n \(mes.content)")))
                }
                DispatchQueue.main.async {
                    self?.messagesCollectionView.reloadDataAndKeepOffset()

                    if shouldScrollToBottom {
                        self?.messagesCollectionView.scrollToLastItem()
                    }
                }
            case .failure(let error):
                print("failed to get messages: \(error)")
            }
        })
    }

    
}

extension ChatViewController: InputBarAccessoryViewDelegate {

    public func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        guard !text.replacingOccurrences(of: " ", with: "").isEmpty,
            let selfSender = self.selfSender else {
                return
        }

        print("Sending: \(text)")

        let mmessage = Message(content: "\(text)", timestamp: "time", messageId: "0", userSenderId: "\(selfSender)")

        // Send Message
   

            // append to existing conversation data
        let messagesucces = self.messagess.sendMessage(message: "\(text)", userSenderId: self.selfSender?.senderId ?? "")
     
   
        if messagesucces == nil {
            self.listenForMessages(shouldScrollToBottom: true)
                    self.messageInputBar.inputTextView.text = nil
                    print("message sent")
                }
                else {
                    print("failed to send")
                }
      
        }
 
    
    

}



extension ChatViewController:MessagesLayoutDelegate, MessagesDisplayDelegate, MessagesDataSource{
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messa[indexPath.section]
    }
    
    
    

var currentSender: SenderType {
    guard let send = self.selfSender  else {return SenderType.self as! SenderType}
    return send
    
}

func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> Message {
    return messages[indexPath.section]
}
    
    private func backgroundColor(for message: Message, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        let sender = message
        if sender.userSenderId == selfSender?.senderId {
            // our message that we've sent
            return .link
        }

        return .secondarySystemBackground
    }
    
    

func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
    return messa.count
}

}






