//
//  CourseStore.swift
//  DesignCode
//
//  Created by Meng To on 2020-01-31.
//  Copyright © 2020 Meng To. All rights reserved.
//

import SwiftUI
import Contentful

let client = Client(spaceId: "0ge8xzmnbp2c", accessToken: "03010b0d79abcb655ca3fda453f2f493b5472e0aaa53664bc7dea5ef4fce2676")

func getArray() {
    let query = Query.where(contentTypeId: "course")
    
    client.fetchArray(of: Entry.self, matching: query) { result in
        print(result)
    }
}
