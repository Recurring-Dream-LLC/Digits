//
//  FixedPrecision.swift
//  Digits
//
//  Created by Jeff Hokit on 12/26/23.
//

import SwiftUI

struct FixedPrecision: View {
    @State private var floatAmount:Double = 55.3
    @State private var minutes = 12
    @State private var seconds = 5
    @State private var sliderValue: Double = 170

    var body: some View {
        VStack(spacing:20) {
            
            // Prefer
            VStack(spacing:20) {
                VStack(alignment: .leading) {
                    
                    Header(title: "Fixed Precision", recommended: true)
                    
                    VStack(alignment: .center,spacing:15){
                        
                        // Fixed Amount
                        Text("\(floatAmount.formatted(.number.precision(.fractionLength(1)))) MB Transferred").monospacedDigit().font(.title)
                        
                        // Fixed Time
                        Text("\(minutes.formatted(.number.precision(.integerLength(0...2)))):\(seconds.formatted(.number.precision(.integerLength(2)))) Remaining").monospacedDigit().font(.title)
                    }
                    .sectionStyle()
                }
            }
            
            // Avoid
            VStack(alignment: .leading) {
                
                Header(title: "Variable Precision", recommended: false)
                
                VStack(alignment: .center,spacing:15){
                    
                    // Variable amount
                    Text("\(floatAmount.formatted(.number.precision(.fractionLength(0...1)))) MB Transferred").monospacedDigit().font(.title)
                    
                    // Variable time
                    if seconds >= 1 {
                        Text("\(minutes.formatted(.number.precision(.integerLength(0...2)))):\(seconds.formatted(.number.precision(.integerLength(2)))) Remaining").monospacedDigit().font(.title)
                    }
                    else {
                        Text("\(minutes) Remaining").monospacedDigit().font(.title)
                    }
                }
                .sectionStyle()
            }
            
            // Prefer
            VStack(spacing:20) {
                VStack(alignment: .leading) {
                    
                    Header(title: "Fixed Precision", recommended: true)
                    
                    VStack(alignment: .center,spacing:15){
                        
                        // Slider
                        HStack{
                            Slider(value: $sliderValue, in: 150...200).frame(width:180)
                            Text(sliderValue.formatted(.number.precision(.fractionLength(1)))).font(.body).monospacedDigit()
                        }
                    }
                    .sectionStyle()
                }
            }
            
            // Avoid
            VStack(alignment: .leading) {
                
                Header(title: "Variable Precision", recommended: false)
                    
                    // Slider
                    HStack{
                        Slider(value: $sliderValue, in: 150...200).frame(width:180)
                        Text(sliderValue.formatted(.number.precision(.fractionLength(0...1)))).font(.body).monospacedDigit().frame(width:40)
                    }
                .sectionStyle()
            }

            
            // Discussion
            VStack(spacing:20) {
                VStack(alignment: .leading) {
                    
                    Text("Discussion").font(.headline)
                    
                    VStack(alignment: .center,spacing:15) {
                        
                        Text("Format values with fixed precision, where the number of digits in the fractional or trailing portion remain the same, without rounding or dropping zeros.")
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
                        
                        VStack(alignment:.leading){
                            Text("Precision Modifiers:")
                            Text("[`.number`](https://developer.apple.com/documentation/foundation/integerformatstyle/3870160-number)")
                                .frame(width: Sizes.discussionMinWidth,alignment: .leading)
                            Text("[`.precision`](https://developer.apple.com/documentation/foundation/integerformatstyle/percent/3766881-precision)")
                            Text("[`.integerLength`](https://developer.apple.com/documentation/foundation/numberformatstyleconfiguration/precision/3798918-integerlength)")
                            Text("[`.fractionLength`](https://developer.apple.com/documentation/foundation/numberformatstyleconfiguration/precision/3767173-fractionlength)")
                        }
                        .frame(width: Sizes.discussionMinWidth,alignment: .leading)

                        Text("This View:\n[FixedPrecision.swift](https://github.com/Recurring-Dream-LLC/Digits/blob/main/Digits/FixedPrecision.swift)")
                        .frame(width: Sizes.discussionMinWidth,alignment: .leading)
                    }
                    .sectionStyle()
                }
            }
            
            // Receive Timers
            .onReceive(halfSecondTimer) { _ in
                floatAmount += 0.1
            }
            .onReceive(secondTimer) { _ in
                // countdown
                seconds = seconds - 1
                if seconds == -1 {
                    minutes = minutes - 1
                    seconds = 59
                }
                
                // reset when reaching 11:55
                if seconds == 55 {
                    minutes = 12
                    seconds = 5
                }
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Fixed Precision")
    }
    
}

#Preview {
    FixedPrecision()
}
