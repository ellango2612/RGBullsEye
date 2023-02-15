//
//  ColorExtension.swift
//  RGBullsEye
//
//  Created by Ella Ngo on 2/4/23.
//

import Foundation
import SwiftUI

// static let element = Color("element")


extension Color {
  /// Create a Color view from an RGB object.
  ///   - parameters:
  ///     - rgb: The RGB object.
  init(rgbStruct rgb: RGB) {
    self.init(red: rgb.red, green: rgb.green, blue: rgb.blue)
  }
}
