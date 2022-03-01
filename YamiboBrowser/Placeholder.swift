//
//  Placeholder.swift
//  YamiboBrowser
//
//  Created by blance on 2021/12/13.
//

import SwiftUI

struct Placeholder: View {
    let progress: Progress
    let text: String
    
    init(progress: Progress = Progress(),
         text: String = "") {
        self.progress = progress
        self.text = text
    }
    
    var body: some View {
        VStack {
            Text(text)
                .font(.system(size: 30))
                .fontWeight(.semibold)
                .foregroundColor(Color.gray)
                
            ProgressView(progress)
                .frame(width: 200.0, height: 100.0)
        }
    }
}

struct Placeholder_Previews: PreviewProvider {
    static var previews: some View {
        Placeholder(progress: Progress(), text: "23")
    }
}
