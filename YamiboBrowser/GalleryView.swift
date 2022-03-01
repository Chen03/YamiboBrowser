//
//  GalleryView.swift
//  YamiboBrowser
//
//  Created by blance on 2021/12/14.
//

import SwiftUI
import SwiftUIPager

struct GalleryView: View {
    let indexs: [Int]
    let urls: [String]
    
    @State var page = Page.first()
    
    init(_ urls: [String]) {
        indexs = Array(0..<urls.count)
        self.urls = urls
    }
    
    var body: some View {
        Pager(page: page,
              data: indexs,
              id: \.self,
              content: { index in
            PageView(urls[index], index: index + 1)
        })
        .horizontal()
        .contentLoadingPolicy(.lazy(recyclingRatio: 3))
//        .draggingAnimation(.standard(duration: 1))
        .draggingAnimation(onChange: .custom(animation: .linear(duration: 0.05)), onEnded: .custom(animation: .spring(response: 0.4, dampingFraction: 0.95 )))
        .sensitivity(.high)
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView([
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020506vfvvfttz3t0zfdrp.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020508yn5574sfjxs55hhf.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020511de7bo9wzbyjq8wej.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020513eb4culi9twhc9cfl.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020514jx3p9aa1x3alle3i.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020518vo0ilezzl33l7ej5.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020519pi1xtxmupjxmut51.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020521jjw1dx5c1dfcz0vi.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020523r2u5u4clgpi45a5g.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020524jhozlb0p6go0a0yn.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020526xm77ph2z5a49ohh5.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020527cptzg1okom344831.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020529tajj3i6sidixi65j.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020530jyd8cd1wthc31xfz.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020531al77nl4988io96iz.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020533o2uzjfwj93hvztad.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020536cwtnmts9tytw428z.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020539th48o2nhhmh8pvs8.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020541j8j2ewjyu8bbw6jb.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020542abet0kxunxvkvtu6.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020544sbupxb97cgjztvgp.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020545cqw4un89ewr17ueu.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020547wgrrkqqgmumoog5p.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020548xji05iid9wwm6im6.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020549xxvx2a2d62bbx92m.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020550icjzclvxwhfvczlu.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020551pooco1it7nz9mitt.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020553p77zw918796ogug5.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020554jynfameppa6mfyvf.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020556bnr4spc4hnww4dnh.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020559fh5hlegl444y58y2.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020601kabldh0klw50bwzr.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020603p9ew07p8rps3w7qq.jpg",
            "https://bbs.yamibo.com/data/attachment/forum/202103/11/020607q88aufiovftozzz9.jpg"
        ])
    }
}
