//
//  HeroDetailView.swift
//  Dota2Show
//
//  Created by 吕博 on 2021/7/15.
//

import SwiftUI
import SwiftUICharts

struct HeroDetailView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    let buildFitness = Legend(color: .yellow, label: "万古流芳", order: 4)
    let fatBurning = Legend(color: .green, label: "传奇", order: 3)
    let warmUp = Legend(color: .blue, label: "统帅", order: 2)
    let low = Legend(color: .gray, label: "中军", order: 1)
    let points: [DataPoint]

    init() {
         points = [
            .init(value: 70, label: "1", legend: low),
            .init(value: 90, label: "2", legend: warmUp),
            .init(value: 91, label: "3", legend: warmUp),
            .init(value: 92, label: "4", legend: warmUp),
            .init(value: 130, label: "5", legend: fatBurning),
            .init(value: 124, label: "6", legend: fatBurning),
            .init(value: 135, label: "7", legend: fatBurning),
            .init(value: 133, label: "8", legend: fatBurning),
            .init(value: 136, label: "9", legend: fatBurning),
            .init(value: 138, label: "10", legend: fatBurning),
            .init(value: 150, label: "11", legend: buildFitness),
            .init(value: 151, label: "12", legend: buildFitness),
            .init(value: 150, label: "13", legend: buildFitness)
        ]
    }
    var body: some View {
        LineChartView(dataPoints: points)
    }
}

struct HeroDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HeroDetailView()
    }
}
