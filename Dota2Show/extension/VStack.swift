//
//  VStack.swift
//  Dota2Show
//
//  Created by 吕博 on 2021/7/15.
//

import Foundation
import SwiftUI

extension VStack {
    func show(showDetail: Bool, id: Int, index: Int) -> some View {
        let isShow = (showDetail && id == index)
        
        return
            frame(width: isShow ? 320 : 240,
                   height: isShow ? 600 : 140, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .rotation3DEffect(
                Angle(degrees: isShow ? -10 : 40),
                axis: (x: 1.0, y: -1.0, z: 0),
                anchor: .center,
                perspective: 1
            )
            
            .shadow(color: Color.black.opacity(0.8), radius: 20, x: 0, y: 10)
            .opacity(1)
            .scaleEffect(0.9)
            .fixedSize(horizontal: true, vertical: false)
            .animation(.easeInOut)
    }
}
