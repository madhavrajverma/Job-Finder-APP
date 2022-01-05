//
//  MessageView.swift
//  MessageView
//
//  Created by Madhav Raj Verma on 05/01/22.
//

import SwiftUI

enum MessagStyle {
     case primary
    case secondary
}

struct MessageView: View {
    let username:String
    let messageText:String
    let style:MessagStyle
    
    var body: some View {
        VStack(alignment: style == .primary ? .trailing : .leading) {
            if style == .primary {
                Text(messageText)
                    .withPrimaryTextStyle()
                    .lineLimit(nil)
                
            }else {
                Text(messageText)
                    .withSecondaryTextStyle()
                    .lineLimit(nil)
            }
        }
    }
}


//
//struct MessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageView()
//    }
//}
