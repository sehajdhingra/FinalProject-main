//
//  Calendar View.swift
//  FinalProject
//
//  Created by SriSai on 7/31/24.
//

import SwiftUI

struct CalendarView: UIViewRepresentable {
    let range:DateInterval
    @ObservedObject var eventStore: EventStore;
    
    func makeUIView(context: Context) -> UICalendarView {
        let view=UICalendarView()
        view.delegate=context.coordinator
        view.calendar=Calendar(identifier:.gregorian)
        view.availableDateRange=range
        return view
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self, eventStore: _eventStore)
    }
    
    func updateUIView(_ uiView: UICalendarView, context: Context) {
        
    }
    
    class Coordinator: NSObject, UICalendarViewDelegate{
        var parent: CalendarView
        @ObservedObject var eventStore: EventStore
        init(parent: CalendarView, eventStore: ObservedObject<EventStore>) {
            self.parent = parent
            self._eventStore = eventStore
        }
        
        @MainActor
        func calendarView(_ calendarView: UICalendarView,decorationFor dateComponents:DateComponents) -> UICalendarView.Decoration? {
            let found=eventStore.events.filter{$0.date.startOfDay==dateComponents.date?.startOfDay}
            
            if(found.isEmpty){
                return nil
            }
            
            if(found.count>1){
                return .image(UIImage(systemName:"doc.on.doc.fill"),color:.red,size:.large)
            }
            
            let single=found.first!
            
            return .customView {
                    let icon = UILabel()
                    icon.text = single.eventType.icon
                    return icon
            }
        }
    }
    
}
