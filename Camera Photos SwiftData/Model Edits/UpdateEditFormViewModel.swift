//
//  UpdateEditFormViewModel.swift
//  Camera Photos SwiftData
//
//  Created by Marcin Jędrzejak on 25/04/2024.
//

import UIKit

@Observable
class UpdateEditFormViewModel {
    var name: String = ""
    var data: Data?

    var sample: SampleModel?

    var image: UIImage {
        if let data, let uiImage = UIImage(data: data) {
            return uiImage
        } else {
            return Constants.placeholder
        }
    }

    init() {}
    init(sample: SampleModel) {
        self.sample = sample
        self.name = sample.name
        self.data = sample.data
    }

    @MainActor
    func clearImage() {
        data = nil
    }

    var isUpdating: Bool { sample != nil }
    var isDisabled: Bool { name.isEmpty }
}
