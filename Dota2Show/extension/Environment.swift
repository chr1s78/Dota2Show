//
//  Environment.swift
//  Dota2Show
//
//  Created by 吕博 on 2021/6/29.
//

import Foundation
import SwiftUI

private struct CustomLaunchKey: EnvironmentKey {
  static let defaultValue = false
}

extension EnvironmentValues {
  var CustomLaunchJSONFinished: Bool {
    get { self[CustomLaunchKey.self] }
    set { self[CustomLaunchKey.self] = newValue }
  }
}
