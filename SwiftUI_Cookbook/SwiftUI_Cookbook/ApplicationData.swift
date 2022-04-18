//
//  ApplicationData.swift
//  SwiftUI_Cookbook
//
//  Created by Christopher Hicks on 4/18/22.
//

import SwiftUI

final class ApplicationData: ObservableObject {
    @Published var title: String = "Default Title"
}
