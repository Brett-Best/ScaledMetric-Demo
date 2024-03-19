//
//  ContentView.swift
//  ScaledMetric Demo
//
//  Created by Brett Best on 17/3/2024.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      NavigationStack {
        ScrollView([.horizontal, .vertical]) {
          VStack(alignment: .leading) {
            ForEach(Font.TextStyle.allCases.reversed(), id: \.self) { textStyle in
              ForEach(DynamicTypeSize.allCases, id: \.self) { dynamicTypeSize in
                ScaledMetricView(textStyle: textStyle)
                  .dynamicTypeSize(dynamicTypeSize)
                  .frame(maxWidth: .infinity, alignment: .leading)
              }
            }
          }
        }
        .navigationTitle("ScaledMetric Demo")
      }
      .tabItem {
        Label("Dynamic Type Size x Font Text Style", systemImage: "wand.and.stars.inverse")
      }
    }
  }
}

struct ScaledMetricView: View {
  @Environment(\.dynamicTypeSize) var dynamicTypeSize

  @ScaledMetric var sm1: CGFloat
  @ScaledMetric var sm2: CGFloat
  @ScaledMetric var sm4: CGFloat
  @ScaledMetric var sm8: CGFloat
  @ScaledMetric var sm12: CGFloat
  @ScaledMetric var sm16: CGFloat
  @ScaledMetric var sm20: CGFloat
  @ScaledMetric var sm24: CGFloat
  @ScaledMetric var sm36: CGFloat
  @ScaledMetric var sm48: CGFloat
  @ScaledMetric var sm72: CGFloat


  let textStyle: Font.TextStyle

  init(textStyle: Font.TextStyle) {
    self.textStyle = textStyle
    _sm1 = .init(wrappedValue: 1, relativeTo: textStyle)
    _sm2 = .init(wrappedValue: 2, relativeTo: textStyle)
    _sm4 = .init(wrappedValue: 4, relativeTo: textStyle)
    _sm8 = .init(wrappedValue: 8, relativeTo: textStyle)
    _sm12 = .init(wrappedValue: 12, relativeTo: textStyle)
    _sm16 = .init(wrappedValue: 16, relativeTo: textStyle)
    _sm20 = .init(wrappedValue: 20, relativeTo: textStyle)
    _sm24 = .init(wrappedValue: 24, relativeTo: textStyle)
    _sm36 = .init(wrappedValue: 36, relativeTo: textStyle)
    _sm48 = .init(wrappedValue: 48, relativeTo: textStyle)
    _sm72 = .init(wrappedValue: 72, relativeTo: textStyle)
  }

  var body: some View {
    Section(
      content: {
        let height: CGFloat = 2

        VStack(alignment: .leading, spacing: sm1) {
          Color.pink.frame(width: sm1, height: height)
          Color.pink.frame(width: sm2, height: height)
          Color.pink.frame(width: sm4, height: height)
          Color.pink.frame(width: sm8, height: height)
          Color.pink.frame(width: sm12, height: height)
          Color.pink.frame(width: sm16, height: height)
          Color.pink.frame(width: sm20, height: height)
          Color.pink.frame(width: sm24, height: height)
          Color.pink.frame(width: sm36, height: height)
          Color.pink.frame(width: sm48, height: height)
          Color.pink.frame(width: sm72, height: height)
        }
      },
      header: {
        Text("\(textStyle) • \(dynamicTypeSize)")
          .font(.system(textStyle))
      }
    )
  }
}

#Preview {
  ContentView()
}
