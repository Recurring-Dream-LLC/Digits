//
//  ContentView.swift
//  Digits
//
//  Created by Jeff Hokit on 12/26/23.
//

import SwiftUI
import Foundation
import Combine

enum Category {
    case monospacedDigits, fixedPrecision, limitedDetail, units, sideEffects
}


struct ContentView: View {
    
    @State var visibility: NavigationSplitViewVisibility = .doubleColumn
    @State var selection: Category = .monospacedDigits
    
    var body: some View {
        NavigationSplitView(columnVisibility: $visibility) {
            List(selection: $selection) {
                NavigationLink(value: Category.monospacedDigits) {
                    Text("Monospaced Digits")
                }
                NavigationLink(value: Category.fixedPrecision) {
                    Text("Fixed Precision")
                }
                NavigationLink(value: Category.limitedDetail) {
                    Text("Readable Detail and Rate")
                }
                NavigationLink(value: Category.units) {
                    Text("Stable Units")
                }
                NavigationLink(value: Category.sideEffects) {
                    Text("Side Effects")
                }


            } .navigationSplitViewColumnWidth(min: 200, ideal: 200, max: 200)
        }
    detail:
        {
            ScrollView{
                switch selection {
                case .monospacedDigits:
                    MonospaceDigits()
                case .fixedPrecision:
                    FixedPrecision()
                case .limitedDetail:
                    LimitedDetail()
                case .units:
                    StableUnits()
                case .sideEffects:
                    SideEffects()

                }
            }
        }
    }
}


#Preview {
    ContentView()
}
