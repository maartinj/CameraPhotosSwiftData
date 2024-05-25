//
//  SampleView.swift
//  Camera Photos SwiftData
//
//  Created by Marcin Jędrzejak on 21/04/2024.
//

// Link Part 1: https://www.youtube.com/watch?v=T7wf4DGPCHs&ab_channel=StewartLynch
// Link Part 2: https://www.youtube.com/watch?v=WT7bYj80gJ0&ab_channel=StewartLynch
// Link Part 3: https://www.youtube.com/watch?v=1ZYE5FcUN4Y&ab_channel=StewartLynch

import SwiftUI
import SwiftData

struct SampleView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var formType: ModelFormType?
    let sample: SampleModel
    var body: some View {
        VStack {
            Text(sample.name)
                .font(.largeTitle)
            ZoomableScrollView {
                Image(uiImage: sample.image == nil ? Constants.placeholder : sample.image!)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding()
            }
            HStack {
                Button("Edit") {
                    formType = .update(sample)
                }
                .sheet(item: $formType) { $0 }
                Button("Delete", role: .destructive) {
                    modelContext.delete(sample)
                    try? modelContext.save()
                    dismiss()
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
