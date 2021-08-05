//
//  LiskovSubstitutionPrinciple.swift
//  SOLID
//
//  Created by Mac on 2021/8/5.
//

import SwiftUI
import Foundation

struct LiskovSubstitutionPrinciple: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//MARK: Liskov Substitution Principle Before
/*
class Handler {

   func save(string: String) {
        // Save string in the Cloud
    }
}

class FilteredHandler: Handler {

    override func save(string: String) {
       guard string.count > 5 else { return }

        super.save(string: string)
    }
}
*/

// the LSP is broken as in the subclass we need to add the precondition that the length of the string must be greater than 5.
// The client associated with the Handler doesn’t expect that the FilteredHandler has a different precondition

//MARK: Liskov Substitution Principle After
class Handler {

    func save(string: String, minChars: Int = 0) {
        guard string.count >= minChars else { return }

        // Save string in the Cloud
    }
}

struct LiskovSubstitutionPrinciple_Previews: PreviewProvider {
    static var previews: some View {
        LiskovSubstitutionPrinciple()
    }
}
