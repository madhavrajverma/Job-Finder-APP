//
//  CVView.swift
//  JobFinder
//
//  Created by Lakshya  Verma on 02/05/22.
//

import SwiftUI

struct CVView: View {
    @EnvironmentObject var FetchPostVM: FetchPostViewModel
    @State private var data = Data()
    let applicationsData:Applications
    var body: some View {
        VStack {
            PDFKitRepresentedView(data)
        }.navigationTitle("Resume")
            .onAppear {
                FetchPostVM.downloadResume(url: applicationsData.resume ?? "") { result in
                    switch result {
                    case .success(let data):
                        self.data = data
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
    }
}


//struct CVView_Previews: PreviewProvider {
//    static var previews: some View {
//        CVView()
//    }
//}
