//
    // Project: navigationTabViewExample2
    //  File: ChatView.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    

import SwiftUI

struct ChatView: View {
    let username: String // Receive the username from profileView
    @State private var showSendSheet = false // Tracks if the sheet is open
    @State private var showCallScreen = false
    
    var body: some View {
        VStack {
            // Custom Navigation Bar
            HStack {
                Button(action: {
                    // Navigate back action
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.blue)
                }
                
                Spacer()
                
                // User Avatar & Name
                HStack(spacing: 10) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.gray)
                    
                    Text(username)
                        .font(.title2)
                        .bold()
                }
                
                Spacer()
                
                // Call Button in Nav Bar
                Button(action: {
                    showCallScreen.toggle()
                }) {
                    Image(systemName: "phone.fill")
                        .font(.title2)
                        .foregroundColor(.green)
                }
            }
            .padding()
            
            Divider() // Thin separator for the header
            
            // Chat Messages Placeholder
            List {
                ChatBubble(text: "Hey there! 👋", isCurrentUser: false)
                ChatBubble(text: "Hi! How's it going?", isCurrentUser: true)
                ChatBubble(text: "Pretty good! Want to hop on a call?", isCurrentUser: false)
            }
            .listStyle(.plain)
            
            // Chat Input & Buttons
            HStack {
                Button(action: {
                    showSendSheet.toggle()
                }) {
                    Image(systemName: "photo.fill")
                        .font(.title)
                        .foregroundColor(.blue)
                }
                
                Spacer()
                
                Button(action: {
                    showCallScreen.toggle()
                }) {
                    HStack {
                        Image(systemName: "phone.fill")
                        Text("Call")
                    }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            }
            .padding()
        }
        .background(Color(.systemGray6).edgesIgnoringSafeArea(.all))
        
        // Open Image Sending Sheet
        .sheet(isPresented: $showSendSheet) {
            SendImageView()
        }
        
        // Open Call Screen in Full Screen
        .fullScreenCover(isPresented: $showCallScreen) {
            CallView(username: username)
        }
    }
}

// ChatBubble View for Messages
struct ChatBubble: View {
    let text: String
    let isCurrentUser: Bool
    
    var body: some View {
        HStack {
            if isCurrentUser {
                Spacer()
                Text(text)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(16)
                    .frame(maxWidth: 250, alignment: .trailing)
            } else {
                Text(text)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .foregroundColor(.black)
                    .cornerRadius(16)
                    .frame(maxWidth: 250, alignment: .leading)
                Spacer()
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ChatView(username: "NDC")
}
