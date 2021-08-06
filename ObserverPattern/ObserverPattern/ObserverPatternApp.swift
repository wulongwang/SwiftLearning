//
//  ObserverPatternApp.swift
//  ObserverPattern
//
//  Created by Mac on 2021/8/6.
//
//https://medium.com/99ridho/swift-design-pattern-observer-pattern-fc009b783d19

//观察者模式是一种设计模式，它强调当 Observable 发生变化或其他事件时对象的反应。
//Observable 观察者 Attaching & removing observables，Notify the observables about the changes
//Observer 被观察对象

import SwiftUI

@main
struct ObserverPatternApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    init() {
        observerDemo()
    }
    
    func observerDemo() {
        let obs1 = MyObserver(id: 1) //被观察对象
        let obs2 = MyObserver(id: 2) //被观察对象
        let obsv = Variable<String>() //观察者
        obsv.addObserver(observer: obs1)
        obsv.addObserver(observer: obs2)
        obsv.value = "Hello world"
        obsv.removeObserver(observer: obs1)
        obsv.value = "Obs1 removed, yey"
    }
}


protocol Observer {
    var id : Int { get } // property to get an id
    func update<T>(with newValue: T)
}

protocol Observable {
    associatedtype T
    var value : T { get set }
    var observers : [Observer] { get set }
    
    func addObserver(observer: Observer)
    func removeObserver(observer: Observer)
    func notifyAllObservers<T>(with newValue: T)
}

class Variable<T> : Observable {
    
    private var _value : T! = nil
    private var _observers : [Observer] = []
    
    var value : T {
        get {
            return self._value
        }
        set {
            self._value = newValue
            self.notifyAllObservers(with: newValue)
        }
    }
    
    var observers : [Observer] {
        get {
            return self._observers
        }
        set {
            self._observers = newValue
        }
    }
    
    func addObserver(observer: Observer) {
        observers.append(observer)
    }
    
    func removeObserver(observer: Observer) {
        observers = observers.filter({$0.id != observer.id})
    }
    
    func notifyAllObservers<T>(with newValue: T) {
        for observer in observers {
            observer.update(with: newValue)
        }
    }
}

class MyObserver : Observer {
    
    private var _id : Int = 0
    
    var id: Int {
        get {
            return self._id
        }
    }
    
    init(id: Int) {
        self._id = id
    }
    
    func update<T>(with newValue: T) {
        print("Whoaa, observer #\(self.id) updated with new value : ", newValue)
    }
}
