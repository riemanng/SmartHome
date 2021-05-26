//
//  HomeBackground.swift
//  SmartHome
//
//  Created by Константин Доронин on 11.05.2021.
//

import SwiftUI

struct HomeBackground: View {
    var body: some View {
        VStack(spacing: 0) {
            Colors.userView
            Colors.historyView
        }
        .ignoresSafeArea()
    }
}
