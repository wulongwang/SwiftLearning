//
//  UserStore.swift
//  DesignCode
//
//  Created by Meng To on 2020-04-02.
//  Copyright © 2020 Meng To. All rights reserved.
//

import SwiftUI
import Combine

class UserStore: ObservableObject {
    @Published var isLogged = false
    @Published var showLogin = false
}
