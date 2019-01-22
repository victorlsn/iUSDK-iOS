//
//  PhoneContact.swift
//  iUSDK iOS
//
//  Created by Victor Negrao on 18/01/19.
//  Copyright © 2019 ZIG. All rights reserved.
//

import Foundation

/**
 Esta classe representa o objeto CustomerContact
 */
public class PhoneContact : NSObject {
    
    // MARK: Variáveis da classe
    
    /**
     String contendo o nome do contato
     */
    @objc dynamic var name : String = ""
    /**
     String contendo o número de telefone do contato
     */
    @objc dynamic var phone : String = ""
    
    convenience init(name: String)
    {
        self.init()
        self.name = name
    }
}
