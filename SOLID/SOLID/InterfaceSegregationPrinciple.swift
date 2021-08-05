//
//  InterfaceSegregationPrinciple.swift
//  SOLID
//
//  Created by Mac on 2021/8/5.
//

import SwiftUI

struct InterfaceSegregationPrinciple: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}


//MARK: Interface Segregation Principle Before

/*
protocol AnimalProtocol {
    func eat()
    func swim()
}

class Fish: AnimalProtocol {
    func eat() {
        print("something")
    }
    
    func swim() {
        print("something")
    }
}

class Dog: AnimalProtocol {
    func eat() {
        print("something")
    }
    
    func swim() { }
}*/

//Dog class don’t need swim()

//MARK: Interface Segregation Principle After

protocol EatProtocol {
    func eat()
}

protocol SwimProtocol {
    func swim()
}

class Fish: EatProtocol, SwimProtocol {
    func eat() {
        print("something")
    }
    
    func swim() {
        print("something")
    }
}

class Dog: EatProtocol {
    func eat() {
        print("something")
    }
}

struct InterfaceSegregationPrinciple_Previews: PreviewProvider {
    static var previews: some View {
        InterfaceSegregationPrinciple()
    }
}
