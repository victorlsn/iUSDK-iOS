//
//  ContactsUtil.swift
//  iUSDK iOS
//
//  Created by Victor Negrao on 18/01/19.
//  Copyright © 2019 ZIG. All rights reserved.
//

import Contacts
import Foundation

@available(iOS 9.0, *)
public class ContactsController : NSObject {
    
    static var contactStore = CNContactStore()
    
    /**
     Este método executa a leitura da agenda de contatos do dispositivo, filtra os contatos válidos e chama os métodos de armazenamento no banco de dados e criação de contatos iU.
     */
    public static func doContactsRoutine(userAreaCode : String) -> [PhoneContact] {
        let contactsStore = self.contactStore
        let fetchRequest = CNContactFetchRequest(keysToFetch: [CNContactGivenNameKey as CNKeyDescriptor,
                                                               CNContactFamilyNameKey as CNKeyDescriptor,
                                                               CNContactPhoneNumbersKey as CNKeyDescriptor])
        var phoneContacts = [PhoneContact]()
        do {
            try contactsStore.enumerateContacts(with: fetchRequest) {
                (contact, stop) in
                
                let phoneContact = PhoneContact(name: "\(contact.givenName) \(contact.familyName)")
                if (!contact.phoneNumbers.isEmpty) {
                    for phoneNumber in contact.phoneNumbers {
                        let phone = phoneNumber.value
                        let phoneNumberString = FormatUtil.getValidPhoneNumber(phone.stringValue, userAreaCode )
                        
                        if !phoneNumberString.isEmpty{
                            phoneContact.phone = phoneNumberString
                            
                            phoneContacts.append(phoneContact)
                        }
                    }
                }
            }
        }
        catch {
            print("unable to fetch contacts")
        }
        return phoneContacts
    }
}
