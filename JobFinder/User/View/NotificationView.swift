//
//  NotificationView.swift
//  JobFinder
//
//  Created by Lakshya  Verma on 05/05/22.
//

import SwiftUI

struct NotificationView: View {
    @Environment(\.presentationMode) var presnetationMode
    @EnvironmentObject var notificationVM : NotificationViewModel
    var body: some View {
            ScrollView {
                VStack(spacing:16) {
                    ForEach(notificationVM.notifications,id:\._id) {  notification in
                        SingleNotification(singleNotification: notification)
                            .padding(.horizontal)
                    }
                }
            }
            .onAppear(perform: {
                notificationVM.getAllNotification()
            })
            .navigationTitle("Notifications")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presnetationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName:  "chevron.left")
                                .foregroundColor(.red)
                            Text("Back")
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                        }
                    }
                }
            }
           
           
        
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
            .environmentObject(NotificationViewModel())
    }
}


struct SingleNotification : View {
    
    let singleNotification:NotificationModel
    
    
    var body: some View {
        VStack(spacing:10) {
            HStack {
                Image(systemName: "lanyardcard")
                    .foregroundColor(Color("buttonColor"))
                    .font(.system(size: 30))
                VStack(alignment:.leading,spacing:20){
                    Text("\(singleNotification.notification) \(singleNotification.job)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .opacity(0.6)

                }
             Spacer()
            }
            HStack {
                Spacer()
                Text(changeToDate(from:singleNotification.date))
                    .font(.footnote)
                    .fontWeight(.light)
                
            }.padding(.trailing)
        }
        .padding(20)
            .background( Color("Mlight"))
            .cornerRadius(10)
            
    }
}
