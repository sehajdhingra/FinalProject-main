//
//  HomeScreen.swift
//  FinalProject
//
//  Created by SriSai on 7/30/24.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(spacing: 20) { // Adds spacing between elements.
                    
                    // Main Image
                    Image("style2")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 350)
                    
                    // Title
                    Text("Hello User!")
                        .font(.title)
                        .fontWeight(.bold)
                        .bold()
                    
                    // Screen Information
                    Text("Welcome to MindSpace! Explore the features below to add tasks, set reminders, and keep a journal, all designed to help you stay organized and mindful.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                    
                    // Buttons
                    HStack(spacing: 20) {
                        // Journal Button
                        NavigationLink(destination: Journal()) {
                            Text("Journal")
                                .fontWeight(.bold)
                                .frame(width: 160, height: 45)
                                .background(Color(hex: "91D7E0"))
                                .cornerRadius(5)
                                .foregroundColor(.white)
                        }
                    
                        // Tasks Button
                        NavigationLink(destination: Tasks()) {
                            Text("Tasks")
                                .fontWeight(.bold)
                                .frame(width: 160, height: 45)
                                .background(Color(hex: "91D7E0"))
                                .cornerRadius(5)
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding()
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }
}

// Allows the usage of hex codes, this subroutine is not mine.
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        var rgb: UInt64 = 0
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            Scanner(string: hexColor).scanHexInt64(&rgb)
        } else {
            Scanner(string: hex).scanHexInt64(&rgb)
        }
        
        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

#Preview {
    HomeScreen()
}
