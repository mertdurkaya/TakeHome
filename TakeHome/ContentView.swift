//
//  ContentView.swift
//  TakeHome
//
//  Created by Mert Durkaya on 17/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            print("Users Response!")
            dump(
                try? StaticJSONMapper.decode(file: "UsersStaticData",
                                             type: UsersResponse.self)
            )
            
            print("Single User Response!")
            dump(
                try? StaticJSONMapper.decode(file: "SingleUserData",
                                             type: UserDetailResponse.self)
            )
        }
    }
}

#Preview {
    ContentView()
}
