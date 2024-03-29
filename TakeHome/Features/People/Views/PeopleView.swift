//
//  PeopleView.swift
//  TakeHome
//
//  Created by Mert Durkaya on 18/02/2024.
//

import SwiftUI

struct PeopleView: View {
    
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 16), count: 2)
    
    @State private var users: [User] = []
    
    @State private var isCreatePresented = false
    
    var body: some View {
        NavigationView {
            ZStack {
                background
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(users, id: \.id) { user in
                            NavigationLink(destination: DetailView(user: user)) {
                                PersonItemView(user: user)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("People")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    create
                }
            }
            .onAppear {
            
                NetworkManager.shared.request("https://reqres.in/api/users/", type: UsersResponse.self) { res in
                    switch res {
                    case .success(let response):
                        self.users = response.data
                    case .failure(let error):
                        print(error)
                    }
                }
            }
            .sheet(isPresented: $isCreatePresented) {
                CreateView()
            }
        }
    }
}

#Preview {
    PeopleView()
}

private extension PeopleView {
    
    var background: some View {
        Theme.background
            .ignoresSafeArea(edges: .top)
    }
    
    var create: some View {
        Button {
            isCreatePresented.toggle()
            
        } label: {
            Symbols.plus
                .font(.system(.headline, design: .rounded))
                .bold()
        }
    }
}
