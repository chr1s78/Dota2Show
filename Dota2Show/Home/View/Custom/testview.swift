//
//  testview.swift
//  Dota2Show
//
//  Created by 吕博 on 2021/7/6.
//

import SwiftUI

struct testview: View {
    @Environment(\.presentationMode) var presentation
    @State var sheetDetail: InventoryItem?
    var body: some View {
        Button("Show Part Details") {
            sheetDetail = InventoryItem(
                id: "0123456789",
                partNumber: "Z-1234A",
                quantity: 100,
                name: "Widget")
        }
        .sheet(item: $sheetDetail) { detail in
//            VStack(alignment: .leading, spacing: 20) {
//                Text("Part Number: \(detail.id)")
//                Text("Name: 2")
//                Text("Quantity On-Hand: 3")
//            }
            sheetView(sheetDetail: $sheetDetail)
            .onTapGesture {
                sheetDetail = nil
            }
        }
    }

    func didDismiss() {
        // Handle the dismissing action.
        sheetDetail = nil
    }
}

struct sheetView: View {
    @Binding var sheetDetail: InventoryItem?
    
    init(sheetDetail: Binding<InventoryItem?>?) {
        self._sheetDetail = Binding.constant(InventoryItem(id: "1", partNumber: "2", quantity: 3, name: "4"))
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(String(self.sheetDetail!.partNumber))
            Text("Name: 2")
            Text("Quantity On-Hand: 3")
            
            Button("close") {
                self.sheetDetail = nil
            }
        }
    }
}

struct InventoryItem: Identifiable {
    var id: String
    let partNumber: String
    let quantity: Int
    let name: String
}

struct testview_Previews: PreviewProvider {
    static var previews: some View {
        testview()
    }
}
