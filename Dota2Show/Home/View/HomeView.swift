//
//  HomeView.swift
//  Dota2Show
//
//  Created by 吕博 on 2021/6/29.
//

import SwiftUI
import SDWebImageSwiftUI
import SwiftUICharts

let coloredNavAppearance = UINavigationBarAppearance()

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State var show: Bool = false
    
    init() {
    }
    
    var body: some View {
       
        ZStack {
            
            NavigationView {
                // 动态背景
                ZStack {
                    LottieView(filename: "magic")
                        .background(
                            Image("jugg")
                                .resizable()
                                .opacity(0.8)
                                .blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        )
                        .edgesIgnoringSafeArea(.all)
                    
                    // 切换按钮
                  //  VStack {
//                    NavigationLink(destination: HeroListView().environmentObject(vm)
//                                    .navigationBarHidden(true)) {
//                        VStack {
//                            HStack {
//                                Image(systemName: "tray.circle.fill")
//                                    //   .renderingMode(.original)
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(width: 40, height: 40)
//                                    .foregroundColor(.white)
//                                    .padding(.top, 75)
//                                    .padding(.leading, 20)
//
//                                Spacer()
//                            }
//                            Spacer()
//                        }
//                        .edgesIgnoringSafeArea(.all)
//                    }
//                    .navigationBarHidden(true)
                    
                    // 英雄卡片列表
                    HeroScorllView().environmentObject(vm)
                }
                .navigationBarHidden(true)
            }
        }
    }
}

// 判断a与b是否相等，且c为真
func judegTap(_ a: Int, _ b: Int, _ c: Bool) -> Bool {
    if ( a == b ) && c {
        print("\(a) \(b) can zoom")
        return true
    } else {
        return false
    }
}

struct HeroScorllView: View {
    
    @EnvironmentObject private var vm: HomeViewModel

    var body: some View {
  
        ZStack {
            ScrollView(showsIndicators: false) {
                ScrollViewReader { value in
                    scrollRowView(value: value)
                        .environmentObject(vm)
                }
            }
            
            .frame(width: UIScreen.main.bounds.width/3)
            .offset(x: 30)
            .edgesIgnoringSafeArea(.all)
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HomeViewModel())
    }
}

struct scrollRowView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State var selectHero: HeroModel? = nil
    @State var tapId: Int = 0
    @State var showDetail: Bool = false
    var value:  ScrollViewProxy
    
    init(value: ScrollViewProxy) {
        self.value = value
    }
    
    var body: some View {
        LazyVStack(spacing: -60.0) {
            ForEach(0..<vm.allHeroes.count) { index in
                VStack {
                    WebImage(url: URL(string: URLHeader + vm.allHeroes[index].img!))
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 17.0))
                        .aspectRatio(contentMode: .fit)
                    
                    Spacer()
                    
                    if showDetail == true && index == tapId {
                        HeroDetailView()
                            .environmentObject(vm)
                            .padding(.trailing,0)
                    }
                }
                .show(showDetail: self.showDetail, id: tapId, index: index)
                .id(index)
                .onTapGesture {

                    vm.allHeroes[index].isTap.toggle()
                    
                    // 记录被点击的卡片id
                    self.tapId = index
                    
                    withAnimation {
                        value.scrollTo( index, anchor: .center )
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                        self.showDetail = vm.allHeroes[index].isTap
                    }
                }
            }
        }
        .frame(width: 350)
      //  .background(Color.orange)
    }
}
