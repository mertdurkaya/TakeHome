//
//  CreateView.swift
//  TakeHome
//
//  Created by Mert Durkaya on 24/02/2024.
//

import SwiftUI

struct CreateView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    firstNameField
                    lastNameField
                    jobField
                }
                
                Section {
                    submitButton
                }
            }
            // add toolbar to dismiss the view
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    doneButton
                }
            }
            .navigationTitle("Create")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CreateView()
}

private extension CreateView {
    
    var background: some View {
        Theme.background
            .ignoresSafeArea(edges: .top)
    }
    
    var firstNameField: some View {
        TextField("First Name", text: .constant(""))
    }
    
    var lastNameField: some View {
        TextField("Last Name", text: .constant(""))
    }
    
    var jobField: some View {
        TextField("Job", text: .constant(""))
    }
    
    var submitButton: some View {
        Button("Submit") {
            presentationMode.wrappedValue.dismiss()
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
    
    var doneButton: some View {
        Button("Done") {
            dismiss()
        }
    }
}
