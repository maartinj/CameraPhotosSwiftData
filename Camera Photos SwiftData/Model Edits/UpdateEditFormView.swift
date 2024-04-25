//
//  UpdateEditFormView.swift
//  Camera Photos SwiftData
//
//  Created by Marcin Jędrzejak on 25/04/2024.
//

import SwiftUI
import SwiftData
import PhotosUI

struct UpdateEditFormView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @State var vm: UpdateEditFormViewModel
    @State private var imagePicker = ImagePicker()
    
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
                        PhotosPicker(selection: $imagePicker.imageSelection) {
                            Label("Photos", systemImage: "photo")
                        }
                    }
                    .foregroundStyle(.white)
                    .buttonStyle(.borderedProminent)
                    Image(uiImage: vm.image)
                        .resizable()
                        .scaledToFill()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding()
                }
            }
            .onAppear {
                imagePicker.setup(vm)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        if vm.isUpdating {
                            if let sample = vm.sample {
                                if vm.image != Constants.placeholder {
                                    sample.data = vm.image.jpegData(compressionQuality: 0.8)
                                } else {
                                    sample.data = nil
                                }
                                sample.name = vm.name
                                dismiss()
                            }
                        } else {
                            let newSample = SampleModel(name: vm.name)
                            if vm.image != Constants.placeholder {
                                newSample.data = vm.image.jpegData(compressionQuality: 0.8)
                            } else {
                                newSample.data = nil
                            }
                            modelContext.insert(newSample)
                            dismiss()
                        }
                        
                    } label: {
                        Text(vm.isUpdating ? "Update" : "Add")
                    }
                    .disabled(vm.isDisabled)
                }
            }
        }
    }
}

#Preview {
    UpdateEditFormView(vm: UpdateEditFormViewModel())
}
