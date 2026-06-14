//
    // Project: navigationTabViewExample2
    //  File: ProfileView.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@noahdoescoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    

import SwiftUI

struct ProfileView: View {
    @State private var username: String = "Noah Does Coding"
    @State private var isEditing: Bool = false
    @State private var showImagePicker = false
    @State private var profileImage: Image? = Image(systemName: "person.crop.circle.fill")
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                // MARK: - Profile Image & Name
                VStack {
                    profileImage?
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                        .onTapGesture {
                            showImagePicker.toggle()
                        }
                    
                    if isEditing {
                        TextField("Enter Username", text: $username)
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                    } else {
                        Text(username)
                            .font(.title)
                            .bold()
                    }
                }
                
                // MARK: - Profile Actions
                VStack(spacing: 10) {
                    Button(action: {
                        isEditing.toggle()
                    }) {
                        HStack {
                            Image(systemName: isEditing ? "checkmark.circle.fill" : "pencil.circle.fill")
                            Text(isEditing ? "Save Changes" : "Edit Profile")
                        }
                        .frame(width: 200, height: 50)
                        .background(isEditing ? Color.green : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                    
                    NavigationLink(destination: ChatView(username: username)) {
                        HStack {
                            Image(systemName: "message.fill")
                            Text("Go to Chat")
                        }
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                }
                .padding(.top, 20)
                
                // MARK: - Settings Section
                List {
                    Section(header: Text("Account Settings")) {
                        SettingsRow(icon: "bell.fill", text: "Notifications")
                        SettingsRow(icon: "lock.fill", text: "Change Password")
                        SettingsRow(icon: "person.2.fill", text: "Privacy Settings")
                    }
                    
                    Section(header: Text("Support")) {
                        SettingsRow(icon: "questionmark.circle.fill", text: "Help & FAQ")
                        SettingsRow(icon: "rectangle.portrait.and.arrow.right", text: "Log Out", color: .red)
                    }
                }
                .frame(height: 300)
                .listStyle(InsetGroupedListStyle())
                
                Spacer()
            }
            .padding(.top, 20)
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showImagePicker) {
                // Placeholder for image picker
                Text("Image Picker (To be implemented)")
                    .font(.headline)
                    .padding()
            }
        }
    }
}

// MARK: - Settings Row Component
struct SettingsRow: View {
    let icon: String
    let text: String
    var color: Color = .blue
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(color)
            Text(text)
        }
    }
}

#Preview {
    ProfileView()
}
