//
//  LimitedDetail.swift
//  Digits
//
//  Created by Jeff Hokit on 12/26/23.
//

import SwiftUI

struct LimitedDetail: View {
   // @State private var amount:Int = 1024
    @State private var hundredthsAmount:Double = 55.35
    @State private var tenthsAmount:Double = 55.35
    @State private var secondsAmount:Double = 55.35

    var body: some View {
            VStack(spacing:20) {
                
                // Prefer
                VStack(spacing:20) {
                    VStack(alignment: .leading) {
                        
                        Header(title: "Readable Detail and Rate", recommended: true)
                        
                        VStack(alignment: .center,spacing:15){
                            
                            // Fixed Amount
                            VStack{
                                Text("\(tenthsAmount.formatted(.number.precision(.fractionLength(1)))) MB Transferred").monospacedDigit().font(.title)
                                Text("One Fractional Digit, Updated Twice per Second").font(.caption)
                            }
                            
                            VStack{
                                Text("\(tenthsAmount.formatted(.number.precision(.fractionLength(0)))) MB Transferred").monospacedDigit().font(.title)
                                Text("No Fractional Digits, Updated Once per Second").font(.caption)
                            }
                            
                            
                        }
                        .sectionStyle()
                    }
                }
                
                // Avoid
                VStack(alignment: .leading) {
                    
                    Header(title: "Excessive Detail and Rate", recommended: false)
                    
                    VStack(alignment: .center,spacing:15){
                        

                        // Too many fractional digits
                        VStack{
                            Text("\(hundredthsAmount.formatted(.number.precision(.fractionLength(2)))) MB Transferred").monospacedDigit().font(.title)
                            Text("Two Fractional Digits, Upated 100 Times per Second").font(.caption)
                        }


                    }
                    .sectionStyle()
                }
                
                // Discussion
                VStack(spacing:20) {
                    VStack(alignment: .leading) {
                        
                        Text("Discussion").font(.headline)
                        
                        VStack(alignment: .center,spacing:15) {
                            
                            Text("Display values without excessive detail. Long fractional values provide little extra information to users, especially when digits are changing too fast to be read.\n\nLimiting updates to once or twice per second still gives a sense of progress without being overwhelming or unreadable.")
                                .frame(width: Sizes.discussionMinWidth,alignment: .leading)
                        }
                        .sectionStyle()
                    }
                }

                // Receive Timers
                .onReceive(secondTimer) { date in
                    secondsAmount += 1.024
                }
                .onReceive(halfSecondTimer) { date in
                    tenthsAmount += 0.512
                }
                .onReceive(tenthSecondTimer) { date in
                    hundredthsAmount += 0.1024
                }

                Spacer()
            }
            .padding()
            .frame(minHeight: 450)
            .navigationTitle("Readable Detail and Rate")
        }
}

#Preview {
    LimitedDetail()
}
