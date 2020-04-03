//
//  DetailView.swift
//  H4XOR News
//
//  Created by Vladyslav Lietun on 02.04.2020.
//  Copyright © 2020 Vladyslav Lietun. All rights reserved.
//
import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://wwww.google.com")
    }
}

