//
//  Header.swift
//  Digits
//
//  Created by Jeff Hokit on 12/26/23.
//

import SwiftUI

struct Header: View {
    var title:String
    var recommended:Bool
    
    var body: some View {
        HStack(spacing:4){
            if recommended {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(Color(.systemGreen))
            } else {
                Image(systemName: "xmark.circle")
                    .foregroundColor(Color(.systemRed))
            }
            Text(title)
        }.font(.headline)
    }
}

#Preview {
    VStack{
        Header(title: "Don't Do this", recommended: false)
        Header(title: "Do this", recommended: true)
    }
}
