//
//  Units.swift
//  Digits
//
//  Created by Jeff Hokit on 12/30/23.
//

import SwiftUI

struct StableUnits: View {
    @State private var halfSecondsAmount:Double = 965.5
    
    var body: some View {
        VStack(spacing:20) {
            
            // Prefer
            VStack(spacing:20) {
                VStack(alignment: .leading) {
                    
                    Header(title: "Stable Units", recommended: true)
                    
                    VStack(alignment: .center,spacing:15){
                        
                        // Stable Units
                        VStack{
                            Text("\((halfSecondsAmount/1000).formatted(.number.precision(.fractionLength(2)))) GB of 5.64 GB ").monospacedDigit().font(.title)
                        }
                        
                    }
                    .sectionStyle()
                }
            }
            
            // Avoid
            VStack(alignment: .leading) {
                
                Header(title: "Changing Units", recommended: false)
                
                VStack(alignment: .center,spacing:15){
                    
                    // Changing Units
                    VStack{
                        if (halfSecondsAmount < 1000){
                            Text("\(halfSecondsAmount.formatted(.number.precision(.fractionLength(2)))) MB of 5.64 GB").monospacedDigit().font(.title)
                        }else {
                            Text("\((halfSecondsAmount/1000).formatted(.number.precision(.fractionLength(2)))) GB of 5.64 GB").monospacedDigit().font(.title)
                        }
                    }
                    
                    
                }
                .sectionStyle()
            }
            
            // Discussion
            VStack(spacing:20) {
                VStack(alignment: .leading) {
                    
                    Text("Discussion").font(.headline)
                    
                    VStack(alignment: .center,spacing:15) {
                        
                        Text("Avoid changing units as values fluctuate or accumulate. Whenever possible, pick a reasonable unit and stick to it. Don't force users to make mental conversions between changing units.")
                            .frame(width: Sizes.discussionMinWidth,alignment: .leading)
                        
                    }
                    .sectionStyle()
                }
            }
            
            // Code
            VStack(spacing:20) {
                VStack(alignment: .leading) {
                    
                    Text("Code").font(.headline)
                    
                    VStack(alignment: .leading,spacing:15) {
                        
                        Text("This View:\n[StableUnits.swift](https://github.com/Recurring-Dream-LLC/Digits/blob/main/Digits/StableUnits.swift)")
                            .frame(width: Sizes.discussionMinWidth,alignment: .leading)
                    }
                    .sectionStyle()
                }
            }
            
            // Receive Timer
            .onReceive(halfSecondTimer) { date in
                if halfSecondsAmount > 1040 {
                    // reset
                    halfSecondsAmount = 965.5
                } else {
                    // advance
                    halfSecondsAmount += 4.068
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Stable Units")
    }
}

#Preview {
    StableUnits()
}
