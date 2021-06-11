//
//  ViewUtils.swift
//  JMRI roster
//
//  Created by Tom Homewood - Beam on 11/06/2021.
//

import Foundation
import SwiftUI

struct Unwrap<Value, Content: View>: View {
    private let value: Value?
    private let contentProvider: (Value) -> Content

    init(_ value: Value?,
         @ViewBuilder content: @escaping (Value) -> Content) {
        self.value = value
        self.contentProvider = content
    }

    var body: some View {
        value.map(contentProvider)
    }
}
