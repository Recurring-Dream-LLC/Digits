//
//  MonospaceDigits.swift
//  Digits
//
//  Created by Jeff Hokit on 12/26/23.
//

import SwiftUI


struct MonospaceDigits: View {
    @State private var amount:Int = 1024
    
    var body: some View {
        VStack(spacing:20) {
   
            // Prefer
            VStack(alignment: .leading) {
                
                Header(title: "Monospaced Digits", recommended: true)
                
                VStack(alignment: .center,spacing:15){
                    
                    VStack{
                        AllMonospacedClock().font(.title)
                        Text("All Monospaced Digits").font(.caption)
                    }
                    
                    VStack{
                        // better if time is fairly isolated, and does not effect other content
                        MonospacedSecondsClock().font(.title)
                        Text("Monospaced *Seconds*").font(.caption)
                    }
                    
                    VStack{
                        Text("\(amount) Transferred").monospacedDigit().font(.title)
                    }
                }
                .sectionStyle()
            }

    
            // Avoid
            VStack(alignment: .leading) {
                
                Header(title: "Proportional Digits", recommended: false)
                
                VStack(alignment: .center,spacing:15){
                    ProportionalClock().font(.title)
                    Text("\(amount) Transferred").font(.title)
                }
                .sectionStyle()
            }
            
            // Discussion
            VStack(spacing:20) {
                VStack(alignment: .leading) {
                    
                    Text("Discussion").font(.headline)
                    
                    VStack(alignment: .center,spacing:15) {
                        
                        Text("Use monospaced digits for changing values.\n\nFonts typically default to proportionally sized digits, where character width varies, causing the display to shift and resize as values change.\n\nSome designs mix styles, applying monospace only to faster changing digits. This works best when the rate of change is predictable, such as seconds on a clock.")
                            .frame(width: Sizes.discussionMinWidth,alignment: .leading)
                            .lineLimit(50)

                    }
                    .sectionStyle()
                }
            }
            
            // Code
            VStack(spacing:20) {
                VStack(alignment: .leading) {
                    
                    Text("Code").font(.headline)
                    
                    VStack(alignment: .center,spacing:15) {
                                                
                        Text("Monospace Digits Modifier:\n[`.monospacedDigits`](https://developer.apple.com/documentation/swiftui/font/monospaceddigit())")
                            .frame(width: Sizes.discussionMinWidth,alignment: .leading)
                        
                        Text("Monospace Seconds Sample:\n[*Digits Source Code*](http://github.com)")
                            .frame(width: Sizes.discussionMinWidth,alignment: .leading)

                    }
                    .sectionStyle()
                }
            }
            
            // Receive Timers
            .onReceive(halfSecondTimer) { date in
                amount += 1
            }
            Spacer()
        }
        .padding()
        .frame(minHeight: 450)
        .navigationTitle("Monospaced Digits")
    }
}


fileprivate struct ProportionalClock:View {
    @State private var now:Date = Date()
    var formatter: Date.FormatStyle = Date.FormatStyle()
        .hour()
        .minute(.twoDigits)
        .second(.twoDigits)
    
    var body: some View {
        let timeStr = now.formatted(formatter)
        Text(timeStr)
            .onReceive(secondTimer) { date in
                now = date
            }
    }
}


fileprivate struct AllMonospacedClock:View {
    @State private var now:Date = Date()
    var formatter: Date.FormatStyle = Date.FormatStyle()
        .hour()
        .minute(.twoDigits)
        .second(.twoDigits)
    
    var body: some View {
        let timeStr = now.formatted(formatter)
        Text(timeStr)
            .monospacedDigit()
            .onReceive(secondTimer) { date in
                now = date
            }
    }
}


fileprivate struct MonospacedSecondsClock:View {
    @State private var now:Date = Date()
    @Environment(\.font) var environmentFont // get the default font, if any
    
    // standard formatter
    let formatter: Date.FormatStyle = Date.FormatStyle()
        .hour()
        .minute(.twoDigits)
        .second(.twoDigits)
    
    var body: some View {
        let timeStr = formatter.attributed.format(now).monospacedSeconds(font: environmentFont ?? .body)
        Text(timeStr)
            .onReceive(secondTimer) { date in
                now = date
            }
    }
}


#Preview {
    MonospaceDigits()
}
