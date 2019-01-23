//
//  FormatUtil.swift
//  iUSDK iOS
//
//  Created by Victor Negrao on 18/01/19.
//  Copyright © 2019 ZIG. All rights reserved.
//

import Foundation

internal class FormatUtil {
    /**
     Este método converte uma string de telefone com 8-14 dígitos para o formato (XX) YYYYY-YYYY
     
     - Parameter phoneNumber: String contendo o número de telefone em formato fora de padrão
     - Returns: String contendo o número de telefone devidamente formatado
     */
    internal static func getValidPhoneNumber(_ phoneNumber: String, _ userAreaCode: String) -> String {
        var validPhoneNumber = FormatUtil.stripNonNumericDigitsFromString(phoneNumber)
        
        let startingIndex = validPhoneNumber.startIndex
        switch validPhoneNumber.count {
            
        case 14:
            validPhoneNumber = validPhoneNumber.substring(from: validPhoneNumber.index(startingIndex, offsetBy: 3))
            if validPhoneNumber[validPhoneNumber.index(startingIndex, offsetBy: 2)] != "9" {
                validPhoneNumber = ""
            }
            break
            
        case 13:
            validPhoneNumber = validPhoneNumber.substring(from: validPhoneNumber.index(startingIndex, offsetBy: 2))
            if validPhoneNumber[validPhoneNumber.index(startingIndex, offsetBy: 2)] != "9" {
                validPhoneNumber = ""
            }
            break
            
        case 12:
            validPhoneNumber = validPhoneNumber.substring(from: validPhoneNumber.index(startingIndex, offsetBy: 1))
            if validPhoneNumber[validPhoneNumber.index(startingIndex, offsetBy: 2)] != "9" {
                validPhoneNumber = ""
            }
            break
            
        case 11:
            if validPhoneNumber[validPhoneNumber.index(startingIndex, offsetBy: 2)] != "9" {
                validPhoneNumber = ""
            }
            break
        case 10:
            let areaCode = validPhoneNumber.substring(to: validPhoneNumber.index(startingIndex, offsetBy: 2))
            validPhoneNumber = validPhoneNumber.substring(from: validPhoneNumber.index(startingIndex, offsetBy: 2))
            
            let firstDigit = validPhoneNumber.substring(to: validPhoneNumber.index(startingIndex, offsetBy: 1))
            switch firstDigit {
                
            case "5", "6", "7", "8", "9":
                validPhoneNumber = areaCode+"9"+validPhoneNumber
                break
                
            default:
                validPhoneNumber = ""
                break
            }
            
        case 9:
            validPhoneNumber = userAreaCode + validPhoneNumber
            break
            
        case 8:
            let firstDigit = validPhoneNumber.substring(to: validPhoneNumber.index(startingIndex, offsetBy: 1))
            switch firstDigit {
                
            case "5", "6", "7", "8", "9":
                validPhoneNumber = userAreaCode+"9"+validPhoneNumber
                break
                
            default:
                validPhoneNumber = ""
                break
                
            }
            break
            
        default:
            validPhoneNumber = ""
            break
        }
        return validPhoneNumber
    }
    
    /**
     Este método limpa (remove todo caractere não numérico) de uma String de CPF
     
     - Parameter originalString: String original, contendo quaisquer sinais de pontuação
     
     - Returns: String contendo apenas dígitos numéricos
     */
    internal func stripNonNumericDigitsFromString(_ originalString: String) -> String {
        let charactersToKeep = NSMutableCharacterSet()
        charactersToKeep.addCharacters(in: "1234567890")
        let result = originalString.filter {  return  String($0).rangeOfCharacter(from: charactersToKeep as CharacterSet) != nil  }
        return String(result)
    }
}
