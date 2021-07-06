//
//  LottieTestView.swift
//  Dota2Show
//
//  Created by 吕博 on 2021/6/29.
//

import SwiftUI

struct LottieTestView: View {
    var body: some View {
        ZStack {
            LottieView(filename: "magic")
                .background(Color(#colorLiteral(red: 0.1725490196, green: 0.02352941176, blue: 0.04705882353, alpha: 1)))
                .edgesIgnoringSafeArea(.all)
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct LottieTestView_Previews: PreviewProvider {
    static var previews: some View {
        LottieTestView()
    }
}
