//
//  LaunchView.swift
//  SwiftfulCrypto
//
//  Created by Nick Sarno on 5/14/21.
//

import SwiftUI

struct LaunchView: View {
    
    @EnvironmentObject var heroService: HeroService
    @EnvironmentObject var vm: HomeViewModel
    
    @State private var loadingText: [String] = "正在从OpenDota.com获取数据".map { String($0) }
    @State private var showLoadingText: Bool = false
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State private var counter: Int = 0
    @State private var loops: Int = 0
    @Binding var showLaunchView: Bool
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    Image("dota2")
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    Text("Dota2 Assistant")
                        .font(.custom("Maghrib", size: 40))
                        .foregroundColor(.red)
                }
                
                ZStack {
                    if showLoadingText {
                        HStack(spacing: 0) {
                            ForEach(loadingText.indices) { index in
                                Text(loadingText[index])
                                    .font(.headline)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.red)
                                    .offset(y: counter == index ? -5 : 0)
                            }
                        }
                        .transition(AnyTransition.scale.animation(.easeIn))
                    }
                    
                }
                .offset(y: 120)
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .background(
                NavigationLink(
                    destination: HomeView().environmentObject(vm).navigationTitle(" ")
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true),
                    isActive: $showLaunchView,
                    label: { EmptyView() })
            )
            .onAppear {
                showLoadingText.toggle()
            }
            .onReceive(timer, perform: { _ in
                withAnimation(.spring()) {
                    
                    let lastIndex = loadingText.count - 1
                    if counter == lastIndex {
                        counter = 0
                        loops += 1
                        if loops >= 4 || vm.heroService.isReceiveAllReady {
                            print("loops is \(loops)")
                            print("isReady is \(vm.heroService.isHeroReady)")
                            showLaunchView = true
                            // 停止定时器
                            timer.upstream.connect().cancel()
                        }
                    } else {
                        counter += 1
                    }
                }
        })
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
  
    @State var showLaunchView: Bool = false
    static var previews: some View {
        LaunchView(showLaunchView: .constant(false))
            .environmentObject(HomeViewModel())
            
    }
}
