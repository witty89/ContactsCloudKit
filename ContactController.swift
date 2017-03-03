//
//  ContactController.swift
//  Contacts
//
//  Created by Alex Whitlock on 3/3/17.
//  Copyright © 2017 Alex Whitlock. All rights reserved.
//

import Foundation
import CloudKit

class ContactController {
    
    static let shared = ContactController()
    
    var contacts = [Contact]() {
        didSet {
            DispatchQueue.main.async {
               
                let didRefreshNotification = Notification.Name("DidRefreshNotification")
                let notificationCenter = NotificationCenter.default
                notificationCenter.post(name: didRefreshNotification, object: self)
            }
        }
    }

    func createContact(contactName: String, contactNumber: String, contactEmail: String, completion: @escaping ((Error?) -> Void) = { _ in }) {
        let contact = Contact(name: contactName, phoneNumber: contactName, email: contactEmail)
        CloudKitManager.cloudKitManager.save(record: contact.cloudKitRecord) { (error) in
            defer { completion(error)}
            
            if let error = error {
                print("Error: \(error.localizedDescription) File: \(#file) Line: \(#line)")
                return
            }
            self.contacts.insert(contact, at: 0)
        }
    }
    
//    func deleteContact(recordID: CKRecordID, completion: @escaping (Error?) -> Void) {
//        CloudKitManager.cloudKitManager.deleteRecordWithID(recordID) { (record, error) in
//            if let error = error {
//                print("Error: \(error.localizedDescription) File: \(#file) Line: \(#line)")
//            }
//            // TODO: - Something here
//        }
//        
//    }
//    
//    func editContact(/*fill this in */) {
//        CloudKitManager.cloudKitManager.modifyRecords(<#T##records: [CKRecord]##[CKRecord]#>, perRecordCompletion: <#T##((CKRecord?, Error?) -> Void)?##((CKRecord?, Error?) -> Void)?##(CKRecord?, Error?) -> Void#>, completion: <#T##(([CKRecord]?, Error?) -> Void)?##(([CKRecord]?, Error?) -> Void)?##([CKRecord]?, Error?) -> Void#>)
//    }
    
}










