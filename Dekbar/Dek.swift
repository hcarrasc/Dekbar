//
//  Dek.swift
//  Dekbar
//
//  Created by Hector on 29-09-23.
//

import Foundation

class Dek {
    
    var name: String
    var age: Int
    var appearance: String
    var appearanceDescription: String
    var life : Int
    
    init (name: String, age: Int, appearance: String, appearanceDescription: String){
        self.name = name
        self.age = age
        self.appearance = appearance
        self.appearanceDescription = appearanceDescription
        self.life = 1000
    }
    init (){
        self.name = ""
        self.age = 0
        self.appearance = ""
        self.appearanceDescription = ""
        self.life = 1000
    }
    
    func sayHey (){
        print ("hola! soy \(self.name)")
    }
    
    func aboutMe (){
        print ("hola! \(ProcessInfo.processInfo.userName) soy \(self.name)")
    }
    
}
