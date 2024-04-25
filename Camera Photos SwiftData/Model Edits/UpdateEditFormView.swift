//
//  UpdateEditFormView.swift
//  Camera Photos SwiftData
//
//  Created by Marcin Jędrzejak on 25/04/2024.
//

import SwiftUI
import SwiftData

struct UpdateEditFormView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @State var vm: UpdateEditFormViewModel

    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $vm.name)
                VStack {
                    if vm.data != nil {
                        Button("Clear image") {
                            vm.clearImage()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    HStack {
                        Button("Camera", systemImage: "camera") {
                            
                        }
                    }
                    .foregroundStyle(.white)
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

#Preview {
    UpdateEditFormView(vm: UpdateEditFormViewModel())
}
