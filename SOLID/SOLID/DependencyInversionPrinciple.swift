//
//  DependencyInversionPrinciple.swift
//  SOLID
//
//  Created by Mac on 2021/8/5.
//

import SwiftUI



struct DependencyInversionPrinciple: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//High-level modules should not depend on low-level modules.
//Both should depend on abstractions.
//Abstractions should not depend on details.
//Details should depend on abstractions.

//MARK: Dependency Inversion Principle Before

/*
struct ProductItem {
    let id: String
    let price: Int
    let name: String
}

class DataBase {
    
    func insert( _ : ProductItem) {
        //TODO:
    }
    
    func update( _ : ProductItem) {
        //TODO:
    }
}

class ProductItemsDataBaseService {
    private let dataBase: DataBase
    
    init(dataBase: DataBase) {
        self.dataBase = dataBase
    }
    
    func insert(productItem: ProductItem) {
        dataBase.insert(productItem)
    }
    
    func update(productItem: ProductItem) {
        dataBase.update(productItem)
    }
}*/

//In this example if you want to change your database to a different one.
//We should change our in ProductItemsDataBaseService class functions implementations

//MARK: Dependency Inversion Principle After

protocol Storable {}

struct ProductItem: Storable {
    let id: String
    let price: Int
    let name: String
}

protocol ProductItemsDataBaseProtocol {
    func insert(productItem: ProductItem)
    func update(productItem: ProductItem)
}

protocol DataStore {
    func insert<T>(_ data: T) where T: Storable
    func update<T>(_ data: T)  where T: Storable
    func delete(identifier: String)
}

class ProductItemsDataBaseService: ProductItemsDataBaseProtocol {
    private let dataStore: DataStore
    
    init(dataStore: DataStore) {
        self.dataStore = dataStore
    }
    
    func insert(productItem: ProductItem) {
        dataStore.insert(productItem)
    }
    
    func update(productItem: ProductItem) {
        dataStore.update(productItem)
    }
}


struct DependencyInversionPrinciple_Previews: PreviewProvider {
    static var previews: some View {
        DependencyInversionPrinciple()
    }
}
