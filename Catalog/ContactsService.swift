//
//  ContactsService.swift
//  Catalog
//
//  Created by Kishan on 4/7/19.
//  Copyright © 2019 Kishan. All rights reserved.
//

import UIKit
import Contacts

class ContactsService: NSObject {
    let contactStore = CNContactStore()
    
    // Fetches user's contacts. Filter to those with a phone number
    func fetchContacts() -> Array<CNContact>? {
        var contacts = [CNContact]()
        let keys = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName), CNContactPhoneNumbersKey] as [Any]
        let request = CNContactFetchRequest(keysToFetch: keys as! [CNKeyDescriptor])
        do {
            try self.contactStore.enumerateContacts(with: request) {
                (contact, stop) in
                if (contact.phoneNumbers.count > 0) {
                    contacts.append(contact)
                }
            }
            return contacts
        }
        catch {
            print("fetchContacts() - Could not fetch contacts")
            return nil
        }
    }
    
    func formatNameForContact(contact: CNContact) -> String {
        return "yolo"
    }
}
