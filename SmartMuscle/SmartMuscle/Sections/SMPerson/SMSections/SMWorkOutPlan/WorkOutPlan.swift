//
//  WorkOutPlan.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 18/05/23.
//

import SwiftUI

struct UserWorkPlan: Identifiable {
    let id: Int
    var name: String
    var score: Int
}

struct WorkOutPlan: View {
    
    @State private var userWorkPlan = [
        UserWorkPlan(id: 1, name: "Taylor Swift", score: 90),
        UserWorkPlan(id: 2, name: "Justin Bieber", score: 80),
        UserWorkPlan(id: 3, name: "Adele Adkins", score: 85)
    ]
    
//    @State private var sortOrder = [KeyPathComparator(\User.name)]
//    @State private var selection: User.ID?
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Hello William")
                        .font(.system(size: 30, weight: .bold, design: .default))
                    Text("Good nigth")
                        .font(.system(size: 12, weight: .regular, design: .default))
                }
                .padding(.all)
                //            
                //            Table(selection: $selection, sortOrder: $sortOrder) {
                //                TableColumn("Name", value: \.name)
                //                TableColumn("Score", value: \.score) { user in
                //                    Text(String(user.score))
                //                }
                //                .width(min: 50, max: 100)
                //            } rows: {
                //                TableRow(userWorkPlan(id: 0, name: "First", score: 0))
                //                ForEach(userWorkPlan, content: TableRow.init)
                //                TableRow(userWorkPlan(id: 4, name: "Last", score: 100))
                //            }
                //            .tableStyle(.automatic)
                //            .onChange(of: sortOrder) { newOrder in
                //                userWorkPlan.sort(using: newOrder)
                //            }
            }.padding(.all)
            .navigationTitle("WorkOutPlan")
        }
    }
}

struct WorkOutPlan_Previews: PreviewProvider {
    static var previews: some View {
        WorkOutPlan()
    }
}
