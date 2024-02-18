//
//  PillView.swift
//  TakeHome
//
//  Created by Mert Durkaya on 18/02/2024.
//

import SwiftUI

struct PillView: View {
    
    let id: Int
    
    var body: some View {
        Text("#\(id)")
            .font(.system(.caption, design: .rounded)
                .bold()
            )
            .foregroundColor(.white)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Theme.pill, in: Capsule())
    }
}

#Preview {
    PillView(id: 0)
        .padding()
        .previewLayout(.sizeThatFits)
}
