//
//  DetailView.swift
//  TakeHome
//
//  Created by Mert Durkaya on 18/02/2024.
//

import SwiftUI

struct DetailView: View {
    
//    let user: User
    @State private var userInfo: UserDetailResponse?
    
    let user: User
    
    var body: some View {
        ZStack {
            background
            ScrollView {
                VStack(spacing: 16) {
                    AsyncImage(url: URL(string: user.avatar)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 250)
                            .clipped()
                            .cornerRadius(16)
                    } placeholder: {
                        ProgressView()
                    }
                    .background(Theme.detailBackground, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Group {
                            PillView(id: user.id)
                            detailRow(title: "First Name", value: user.firstName)
                            Divider()
                            detailRow(title: "Last Name", value: user.lastName)
                            Divider()
                            detailRow(title: "Email", value: user.email)
                        }
                        .padding(.vertical, 4)
                        .padding(.horizontal, 8)
                        .foregroundStyle(Theme.text)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 16)
                    .background(Theme.detailBackground, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                    
                    Group {
                        link
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .shadow(color: Theme.text.opacity(0.1), radius: 2, x: 0, y: 1)
                .padding()
            }
            .navigationTitle("\(user.firstName)'s Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear() {
            do {
                userInfo = try StaticJSONMapper.decode(file: "SingleUserData", type: UserDetailResponse.self)
            } catch {
                print("Error: \(error)")
            }
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(user: previewUser)
    }
}

private extension DetailView {
    var background: some View {
        Theme.background
            .ignoresSafeArea(edges: .top)
    }
    
    var link: some View {
        Link(destination: URL(string: user.avatar)!, label: {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Support \(user.firstName)")
                        .font(.footnote)
                }
                Spacer()
                VStack {
                    Symbols.link
                }
            }
        })
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Theme.detailBackground, in: RoundedRectangle(cornerRadius: 16, style: .continuous))

    }
}

private extension DetailView {
    @ViewBuilder
    func detailRow(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.footnote)
                .bold()
            Text(value)
                .font(.system(.body, design: .rounded))
        }
    }
}
