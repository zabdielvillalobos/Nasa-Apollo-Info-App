//
//  CustomDivider.swift
//  moonshot
//
//  Created by Zabdiel Villalobos on 11/16/23.
//

import Foundation

import SwiftUI

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct CustomDivider_Previews: PreviewProvider {
    static var previews: some View {
        CustomDivider()
    }
}
