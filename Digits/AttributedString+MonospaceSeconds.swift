//
//  AttributedString+MonospaceSeconds.swift
//  Digits
//
//  Created by Jeff Hokit on 12/26/23.
//

import Foundation
import SwiftUI


extension AttributedString {
    
    // if the attributed string can be recognized as a foundation date, and has seconds or
    // secondFraction components, then set the font of those components to .monospacedDigit
    func monospacedSeconds(font:Font = .body) -> AttributedString
    {
        // create a mutable copy of the string
        var newString = self
        
        // look for the seconds portion
        for run in newString.runs {
            if let dateFieldAttribute = run.attributes.foundation.dateField,
               dateFieldAttribute == .second || dateFieldAttribute == .secondFraction {
                // When a second or secondFraction run is found, change its attributes.
                let attributeContainer = AttributeContainer().font(font.monospacedDigit())
                newString[run.range].setAttributes(attributeContainer)
            }
        }
        return newString
    }
}
