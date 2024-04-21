//
//  PhotosListView.swift
//  Camera Photos SwiftData
//
//  Created by Marcin Jędrzejak on 21/04/2024.
//

import SwiftUI
import SwiftData

struct PhotosListView: View {
    @Query(sort: \SampleModel.name) var samples: [SampleModel]
    @Environment(\.modelContext) private var modelContext
    var body: some View {
        NavigationStack {
            Group {
                if samples.isEmpty {
                    ContentUnavailableView("Add your first photo", systemImage: "photo")
                } else {
                    List(samples) { sample in
                        NavigationLink(value: sample) {
                            HStack {
                                Image(uiImage: sample.image == nil ? Constants.placeholder : sample.image!)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(12)
                                    .clipped()
                                    .padding(.trailing)
                                Text(sample.name)
                                    .font(.title)
                            }
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                modelContext.delete(sample)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationDestination(for: SampleModel.self) { sample in
                
            }
            .navigationTitle("Picker or Camera")
            .toolbar {
                Button {
                    
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
            }
        }
    }
}

#Preview {
    PhotosListView()
        .modelContainer(SampleModel.preview)
}
