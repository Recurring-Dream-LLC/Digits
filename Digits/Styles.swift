//
//  Styles.swift
//  Digits
//
//  Created by Jeff Hokit on 12/26/23.
//

import Foundation
import SwiftUI

struct SectionStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(minWidth: Sizes.sectionMinWidth)
            .padding()
            .background(in: RoundedRectangle(cornerRadius: 10.0))
    }
}

extension View {
    func sectionStyle() -> some View {
        modifier(SectionStyle())
    }
}
