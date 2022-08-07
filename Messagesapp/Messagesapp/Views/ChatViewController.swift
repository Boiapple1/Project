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
    var messagess = MessagesController()
    var count: Int?
    var i = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        self.messagess.getData()
        self.listenForMessages(with: self.messagess,shouldScrollToBottom: true)
        messageInputBar.delegate = self
        messagesCollectionView.backgroundColor = . systemYellow
        messagesCollectionView.refreshControl = UIRefreshControl()
        messagesCollectionView.refreshControl?.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        title = "GroupChat"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Refresh Chat",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didRefresh))
       
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "LogOut",
                                                          style: .done,
                                                          target: self,
                                                          action: #selector(didTapLogOut))

    }
    


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.messagess.getData()
        messageInputBar.inputTextView.becomeFirstResponder()
        self.listenForMessages(with: self.messagess,shouldScrollToBottom: true)

    }
    @objc private func didPullToRefresh(){
        self.messagess.getData()
        self.listenForMessages(with: self.messagess,shouldScrollToBottom: true)
        DispatchQueue.main.async {
            self.messagesCollectionView.refreshControl?.endRefreshing()
            
              }
    }

    var selfSender: Sender? {
        guard let email = UserDefaults.standard.value(forKey: "email") as? String else {
            return nil
        }
        

        return Sender(senderId: email, displayName: "Me")
    }
 
    

    
    private func listenForMessages(with mesas: MessagesAttributes,shouldScrollToBottom: Bool) {
        DispatchQueue.main.async {
            let a = mesas.count

              for n in 0..<a{
                  self.messa.append(mesa(sender: receiver(senderId: mesas.userSenderId(for: n) ?? "", displayName: "someone"), messageId: mesas.messageId(for: n) ?? "", sentDate: Date(), kind: .text("\(mesas.userSenderId(for: n) ?? "")\n \(mesas.content(for: n) ?? "")")))
                  
              }
           
        }

     DispatchQueue.main.async {
            
                    self.messagesCollectionView.reloadDataAndKeepOffset()
                    
                    if shouldScrollToBottom {
                        self.messagesCollectionView.scrollToLastItem()
                    }
                }
       
    }
    
    @objc
    func didRefresh(){
        

        self.navigationController?.dismiss(animated: false, completion: nil)

    }
    @objc
    func didTapLogOut(){
        
        AuthHandler.logOut(completion: { [weak self] in
            guard let strongSelf = self else {
                return
            }

        }, error: {_ in
            print("Failed to log out")
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
        let messagesucces = self.messagess.sendMessage(message: "\(text)", userSenderId: self.selfSender?.senderId ?? "")
     
   
        if messagesucces == nil {
            self.listenForMessages(with: messagess,shouldScrollToBottom: true)
            self.messagess.getData()
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
func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
    return messa.count
}

}






