//
//  sheet1.swift
//  Dota2Show
//
//  Created by 吕博 on 2021/7/6.
//

import SwiftUI
struct sheet1View: View {
// If the next line is commented, the button will become not clickable after the presentation.
  //  @Environment(\.presentationMode) var presentation
    @State var showSheet = false
    var body: some View {
        NavigationView {
            VStack {
                Text("Test")
            }.sheet(isPresented: self.$showSheet) {
                ModalView()
            }.navigationBarItems(trailing:
                                    Button(action: {
                                        self.showSheet = true
                                    }) {
                                        Text("SecondView")
                                    }
            )
        }
    }
}
struct ModalView: View {
    @Environment(\.presentationMode) var presentation
    var body: some View {
        VStack {
            Button(action: {
                self.presentation.wrappedValue.dismiss()
            }) {
                Text("Dismiss")
            }
        }
    }
}
struct sheet1View_Previews: PreviewProvider {
    static var previews: some View {
        sheet1View()
    }
}
