//
//  SideEffects.swift
//  Digits
//
//  Created by Jeff Hokit on 12/30/23.
//

import SwiftUI

struct SideEffects: View {
    // @State private var amount:Int = 1024
    @State private var secondsAmount:Double = 55.35
    @State private var stableSliderValue: Double = 170
    @State private var sliderValue: Double = 170

    var body: some View {
        VStack(spacing:20) {
            
            // Prefer
            VStack(spacing:20) {
                VStack(alignment: .leading) {
                    
                    Header(title: "Stable Bounding Box", recommended: true)
                    
                    VStack(alignment: .center,spacing:15){
                        
                        // Fixed Amount
                        ConversationalClock().font(.title3)
                        
                    }
                    .sectionStyle()
                }
            }
            
            
            // Avoid
            VStack(alignment: .leading) {
                
                Header(title: "Bounding Box Reacts to Content", recommended: false)
                
                VStack(alignment: .center,spacing:15){
                    
                    ConversationalClock().font(.title3)
                }
                .padding()
                .background(in: RoundedRectangle(cornerRadius: 10.0))
            }
            
            // Prefer #2
            VStack(spacing:20) {
                VStack(alignment: .leading) {
                    
                    Header(title: "Stable Slider Width", recommended: true)
                    
                    VStack(alignment: .center,spacing:15){
                                                
                        // Slider
                       HStack{
                            Slider(value: $stableSliderValue, in: 0...200) {
                                Text("")
                            } minimumValueLabel: {
                                Text("")
                            } maximumValueLabel: {
                                Text(stableSliderValue.formatted(.number.precision(.fractionLength(1)))).font(.body).monospacedDigit()
                            }.frame(width:250)
                        }
                    }
                    .sectionStyle()
                }
            }

    
            
            // Avoid2
            VStack(alignment: .leading) {
                
                Header(title: "Slider Width Reacts to Label", recommended: false)
                
                VStack(alignment: .center,spacing:15){
                    
                    Slider(value: $sliderValue, in: 0...200) {
                        Text("")
                    } minimumValueLabel: {
                        Text("")
                    } maximumValueLabel: {
                        Text(sliderValue.formatted(.number.precision(.fractionLength(0...1)))).font(.body)
                    }.frame(width:250)
                }
                .sectionStyle()
            }
            
            // Discussion
            VStack(spacing:20) {
                VStack(alignment: .leading) {
                    
                    Text("Discussion").font(.headline)
                    
                    VStack(alignment: .center,spacing:15) {
                        
                        Text("Many user interface toolkits react to the size of their content, which becomes problematic when an element with a changing size causes other elements to scale or rearrange, thus magnifying digit design errors.")
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
                        
                        Text("This View:\n[SideEffects.swift](https://github.com/Recurring-Dream-LLC/Digits/blob/main/Digits/SideEffects.swift)")
                            .frame(width: Sizes.discussionMinWidth,alignment: .leading)
                    }
                    .sectionStyle()
                }
            }
            
            
            // Receive Timers
            .onReceive(secondTimer) { date in
                secondsAmount += 1.024
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Side Effects")
    }
}


fileprivate struct ConversationalClock:View {
    @Environment(\.font) var environmentFont // get the default font, if any
    @State var minutes = 10
    @State var seconds = 5
    
    var body: some View {
        
        if seconds > 1 {
            Text("About \(minutes) Minutes, \(seconds) Seconds Remaining").monospacedDigit()
        }
        else if seconds == 1 {
            Text("About \(minutes) Minutes, \(seconds) Second Remaining").monospacedDigit()
        }
        else {
            Text("About \(minutes) Minutes Remaining").monospacedDigit()
        }
        EmptyView().onReceive(secondTimer) { date in
            seconds = seconds - 1
            if seconds == -1 {
                // reset
                minutes = 10
                seconds = 5
            }
            
        }
    }
}

fileprivate struct ConversationalClockStable:View {
    @Environment(\.font) var environmentFont // get the default font, if any
    @State var minutes = 10
    @State var seconds = 5
    
    var body: some View {
        
        if seconds > 1 || seconds == 0 {
            Text("About \(minutes) Minutes, \(seconds) Seconds Remaining").monospacedDigit()
        }
        else if seconds == 1 {
            Text("About \(minutes) Minutes, \(seconds) Second Remaining").monospacedDigit()
        }
        EmptyView().onReceive(secondTimer) { date in
            seconds = seconds - 1
            if seconds == -1 {
                // reset
                minutes = 10
                seconds = 5
            }
            
        }
    }
}



#Preview {
    SideEffects()
}
