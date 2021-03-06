//
//  ContentView.swift
//  YamiboBrowser
//
//  Created by blance on 2021/12/13.
//

import SwiftUI
import Kingfisher
import SwiftUIPager
import WebKit

struct ContentView: View {
    @State var webView = WKWebView()
    @State var sheetPresented = false
    @State var galleryPresented = false
    @State var text = "Test"
    @State var alertShowed = false
    @State var data = ["https://bbs.yamibo.com/template/oyeeh_com_baihe/img/config/img/logo.png"]

    var body: some View {
        NavigationView {
            VStack {
                WebKitView(webView: webView)
                HStack {
                    Button {
                        webView.goBack()
                    } label: {
                        Image(systemName: "arrow.backward")
                    }
                    Button {
                        webView.load(URLRequest(url: URL(string: "https://bbs.yamibo.com/forum.php?mobile=1")!))
                    } label: {
                        Image(systemName: "house")
                    }
                    Button {
                        webView.evaluateJavaScript("""
        (function(){
        var b = Array()
        var imgs = document.getElementsByClassName("postmessage")[0].getElementsByTagName("img");
        for(i = 0; i < imgs.length; ++i) {
            if (imgs[i].id.substr(0, 4) == 'aimg') b.push(imgs[i].parentNode.href);}
            return b;
        })()
        """) {d, err in
                            if (err != nil) {
                                text = err!.localizedDescription
                                alertShowed = true
                            } else if (d != nil) {
                                data = d as! [String]
                                galleryPresented = true
        //                        print(data)
                            }
                        }
                    } label: {
                        Image(systemName: "doc")
                    }
                    NavigationLink(isActive: $galleryPresented) {
                        GalleryView(data)
                    } label: {
                        Image(systemName: "photo")
                    }
                    Button {
                        webView.goForward()
                    } label: {
                        Image(systemName: "arrow.forward")
                    }
                }.buttonStyle(.bordered)
            }
            .ignoresSafeArea(.all, edges: .top)
            .sheet(isPresented: $sheetPresented) {
                text = "OK"
            } content: {
                GalleryView(data)
            }
            .alert(text, isPresented: $alertShowed){
                
        }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WebKitView : UIViewRepresentable { //????????????????????????UIViewRepresentable?????????????????????????????????????????????SwiftUI??????????????????UIView??????
    let webView: WKWebView
    
    func makeUIView(context: UIViewRepresentableContext<WebKitView>) -> WKWebView {
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebKitView>) { //??????????????????updateUIView????????????????????????????????????????????????????????????
        let request = URLRequest(url:URL(string: "https://bbs.yamibo.com/thread-254559-1-1.html?mobile=1")!) //???????????????URLRequest????????????????????????????????????
        uiView.load(request) //??????load??????????????????????????????????????????????????????
    }
}
