//
//  SampleView.swift
//  Camera Photos SwiftData
//
//  Created by Marcin Jędrzejak on 21/04/2024.
//

import SwiftUI
import SwiftData

struct SampleView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    let sample: SampleModel
    var body: some View {
        VStack {
            Text(sample.name)
                .font(.largeTitle)
            Image(uiImage: sample.image == nil ? Constants.placeholder : sample.image!)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
            HStack {
                Button("Edit") {
                    modelContext.delete(sample)
                    try? modelContext.save()
                    dismiss()
                }
                Button("Delete", role: .destructive) {
                    
                }
            }
            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity, alignment: .trailing)
            Spacer()
        }
        .padding()
        .navigationTitle("Sample View")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let container = SampleModel.preview
    let fetchDescriptor = FetchDescriptor<SampleModel>()
    let sample = try! container.mainContext.fetch(fetchDescriptor)[0]
    return NavigationStack { SampleView(sample: sample) }
}
