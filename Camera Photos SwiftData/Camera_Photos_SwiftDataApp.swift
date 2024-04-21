//
//  Camera_Photos_SwiftDataApp.swift
//  Camera Photos SwiftData
//
//  Created by Marcin Jędrzejak on 21/04/2024.
//

import SwiftUI
import SwiftData

@main
struct Camera_Photos_SwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            PhotosListView()
        }
        .modelContainer(for: SampleModel.self)
    }
}
