//
//  SingleResponsibilityPrinciple.swift
//  SOLID
//
//  Created by Mac on 2021/8/5.
//

import SwiftUI

struct SingleResponsibilityPrinciple: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}


//Before
//MARK: Single Responsibility Principle

/**
class Manager {
    func request() -> Data {
        return Data()
    }
    
    func saveInCoreData(_ data: Data) {
    // save here your data
   }
    
    func make() {
        let data = request()
        saveInCoreData(data)
    }
}
 
*/

//After
//MARK: Single Responsibility Principle

class RequestManager {
    func request() -> Data {
        return Data()
    }
}

class CoreDataManager {
    func saveInCoreData(_ data: Data) { }
}

class Manager {
   
    let requestManager: RequestManager
    let coreDataManager: CoreDataManager
    
    init(requestManager: RequestManager,
         coreDataManager: CoreDataManager) {
        self.requestManager = requestManager
        self.coreDataManager = coreDataManager
    }
    
    func make() {
        let data = requestManager.request()
        coreDataManager.saveInCoreData(data)
    }
}



struct SingleResponsibilityPrinciple_Previews: PreviewProvider {
    static var previews: some View {
        SingleResponsibilityPrinciple()
    }
}
