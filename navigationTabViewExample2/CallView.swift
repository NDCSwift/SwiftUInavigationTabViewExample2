//
    // Project: navigationTabViewExample2
    //  File: CallView.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@noahdoescoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    

import SwiftUI

struct CallView: View {
    let username: String
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(gradient: Gradient(colors: [.blue, .purple]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Spacer()
                
                // Circular Profile Image (Placeholder)
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.white.opacity(0.8))
                    .shadow(radius: 10)
                
                // Calling Text
                Text("Calling \(username)...")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                
                Spacer()
                
                // End Call Button
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Image(systemName: "phone.down.fill")
                            .font(.title)
                        Text("End Call")
                            .fontWeight(.semibold)
                    }
                    .padding()
                    .frame(width: 180)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(50)
                    .shadow(radius: 5)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    CallView(username: "NDC")
}
