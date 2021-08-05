//
//  OpenClosedPrinciple.swift
//  SOLID
//
//  Created by Mac on 2021/8/5.
//

import SwiftUI

struct OpenClosedPrinciple: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}


//MARK: Open Closed Principle Before
/*
class Logger {
    func printInfo()  {
        let iPhones = [IPhone(model: "SE", hasCamera: true),
                       IPhone(model: "2G", hasCamera: false),
                       IPhone(model: "11 Pro", hasCamera: true)]
        
        //To add the ability to print and details of a new class, we have to change the implementation of the printInfo method every time we need to log a new class.
        let galaxies = [Galaxy(model: "S10"),
                                Galaxy(model: "S8"),
                                Galaxy(model: "S20")]
        
        for iphone in iPhones {
            print(iphone.print())
        }
        
        for galaxy in galaxies {
            print(galaxy.print())
        }
    }
}

class IPhone {
    let model: String
    let hasCamera: Bool
    
    init(model: String, hasCamera: Bool) {
        self.model = model
        self.hasCamera = hasCamera
    }
    
    func print() -> String {
        let str = hasCamera ? "has camera" : "doesn't have camera"
        return "the iphone \(model)" + str
    }
}

// add new class
class Galaxy {
    let model: String
    
    init(model:String) {
        self.model = model
    }
    func print() -> String{
        return model
    }
} */

//MARK: Open Closed Principle After

//This problem can be solved by creating a new protocol Printable that’s implemented by the classes to log.
//And printInfo itself will print an array of Printable.
//Following this we can create a new abstract layer between printInfo and the class to log which will allow the print of such classes as Galaxy without modifying the printInfo implementation:

protocol Printable {
    func print() -> String
}

class Logger {
    func printInfo() {
        
        let phones: [Printable] = [IPhone(model: "SE", hasCamera: true),
                      IPhone(model: "2G", hasCamera: false),
                      IPhone(model: "11 Pro", hasCamera: true),
                      Galaxy(model: "S10"),
                      Galaxy(model: "S8"),
                      Galaxy(model: "S20"),]
        
        for phone in phones {
            print(phone.print())
        }
    }
}

class IPhone: Printable {
    let model: String
    let hasCamera: Bool
    
    init(model: String, hasCamera: Bool) {
        self.model = model
        self.hasCamera = hasCamera
    }
    
    func print() -> String {
        let str = hasCamera ? "has camera" : "doesn't have camera"
        return "the iphone \(model)" + str
    }
}

class Galaxy: Printable {
    let model: String
    
    init(model:String) {
        self.model = model
    }
    func print() -> String{
        return model
    }
}

struct OpenClosedPrinciple_Previews: PreviewProvider {
    static var previews: some View {
        OpenClosedPrinciple()
    }
}
