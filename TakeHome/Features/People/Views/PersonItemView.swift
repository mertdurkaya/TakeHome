//
//  PersonItemView.swift
//  TakeHome
//
//  Created by Mert Durkaya on 18/02/2024.
//

import SwiftUI

struct PersonItemView: View {
    
    let user: User
    
    var body: some View {
        VStack(spacing: .zero, content: {
            AsyncImage(url: URL(string: user.avatar)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 120)
                    .clipped()
            } placeholder: {
                ProgressView()
            }

            VStack(alignment: .leading, spacing: 4) {
                PillView(id: user.id)
                Text("\(user.firstName) \(user.lastName)")
                    .foregroundStyle(Theme.text)
                    .font(.system(.body, design: .rounded))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Theme.detailBackground)
        })
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(color: Theme.text.opacity(0.1), radius: 2, x: 0, y: 1)
    }
}


var previewUser: User {
    let users = try! StaticJSONMapper.decode(file: "UsersStaticData", type: UsersResponse.self)
    return users.data.first!
}


#Preview {
    PersonItemView(user: previewUser)
        .frame(width: 250)
}
