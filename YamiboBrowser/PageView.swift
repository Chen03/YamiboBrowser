//
//  PageView.swift
//  YamiboBrowser
//
//  Created by blance on 2021/12/13.
//

import SwiftUI
import Kingfisher

struct PageView: View {
    let url: URL
    let text: String
    
    init(_ urlString:String, index: Int? = nil) {
        url = URL(string: urlString)!
        text = index != nil ? String(index!) : "";
    }
    
    var body: some View {
        KFImage(url)
            .placeholder { progress in
                Placeholder(progress: progress, text: text)
            }
            .resizable()
            .scaledToFit()
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView("https://bbs.yamibo.com/data/attachment/forum/202107/02/024935gjb1j014wwjqoybw.jpg", index: 1)
    }
}
