//
//  Contact.swift
//  Contacts
//
//  Created by Alex Whitlock on 3/3/17.
//  Copyright © 2017 Alex Whitlock. All rights reserved.
//

import Foundation
import CloudKit

class Contact {
    
    private let nameKey = "name"
    private let phoneNumberKey = "phoneNumber"
    private let emailKey = "email"
    static let contactKey = "Contact"
    
    let name: String
    let phoneNumber: String
    let email: String
    
    init(name: String, phoneNumber: String, email: String) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
    }
    
    var cloudKitRecordID: CKRecordID?
    
    init?(cloudKitRecord: CKRecord) { /* This has to be where the prob is */
        guard let name = cloudKitRecord[nameKey] as? String,
        let phoneNumber = cloudKitRecord[phoneNumberKey] as? String,
        let email = cloudKitRecord[phoneNumberKey] as? String else { return nil }
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
    }
    
//    convenience init?(cloudKitRecord: CKRecord) {
//        guard let name = cloudKitRecord["name"] as? String, /* for some reason the keys weren't working */
//        let phoneNumber = cloudKitRecord["phoneNumber"] as? String,
//        let email = cloudKitRecord["email"] as? String else { return nil }
//        self.init(name: name, phoneNumber: phoneNumber, email: email)
//    }
    
    var cloudKitRecord: CKRecord {
        let record = CKRecord(recordType: Contact.contactKey)
        record[nameKey] = name as CKRecordValue?
        record[phoneNumberKey] = phoneNumber as CKRecordValue?
        record[emailKey] = email as CKRecordValue?
        return record
    }
}
