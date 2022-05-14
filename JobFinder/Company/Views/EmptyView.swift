//
//  EmptyView.swift
//  JobFinder
//
//  Created by Lakshya  Verma on 05/05/22.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        VStack(alignment:.center,spacing: 20) {
            Spacer()
            Text("No Users Applied")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Image(systemName: "person.fill.questionmark")
                .font(.system(size: 100))

                .foregroundColor(Color("buttonColor"))
            Spacer()
        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
