//
//  ModelFormType.swift
//  Camera Photos SwiftData
//
//  Created by Marcin Jędrzejak on 25/04/2024.
//

import SwiftUI

enum ModelFormType: Identifiable, View {
    case new
    case update(SampleModel)
    
    var id: String {
        String(describing: self)
    }

    var body: some View {
        switch self {
        case .new:
            UpdateEditFormView(vm: UpdateEditFormViewModel())
        case .update(let sample):
            UpdateEditFormView(vm: UpdateEditFormViewModel(sample: sample))
        }
    }
}
