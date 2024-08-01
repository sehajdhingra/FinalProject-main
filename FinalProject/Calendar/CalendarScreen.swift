//
//  CalendarScreen.swift
//  FinalProject
//
//  Created by SriSai on 7/30/24.
//

import SwiftUI

struct CalendarScreen: View {
    @EnvironmentObject var eventStore: EventStore
    
    var body: some View {
        NavigationStack {
            ScrollView {
                CalendarView(range: DateInterval(start: .distantPast, end: .distantFuture),
                             eventStore: eventStore)
            }
            
                .navigationTitle("Calendar View")
        }
    }
}

struct CalendarScreen_Previews: PreviewProvider {
    static var previews: some View {
        CalendarScreen()
            .environmentObject(EventStore(preview: true))
    }
}
