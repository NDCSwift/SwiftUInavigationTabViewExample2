//
    // Project: navigationTabViewExample2
    //  File: HomeView.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                // MARK: - Header Section
                HStack {
                    VStack(alignment: .leading) {
                        Text("Welcome Back,")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("Noah Does Coding") // Replace with dynamic username if needed
                            .font(.title)
                            .bold()
                    }
                    
                    Spacer()
                    
                    // Profile Image Button
                    NavigationLink(destination: ProfileView()) {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.blue)
                    }
                }
                .padding(.horizontal)
                
                // MARK: - Quick Actions Grid
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
        
                    
                
                    
                    NavigationLink(destination: ProfileView()) {
                        HomeFeatureButton(icon: "person.crop.circle", title: "Profile", color: .purple)
                    }
                }
                .padding(.horizontal)
                
                // MARK: - Recent Activity Section
                VStack(alignment: .leading) {
                    Text("Recent Activity")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    ScrollView {
                        VStack(spacing: 10) {
                            ForEach(["Alex", "Samantha", "John"], id: \.self) { name in
                                RecentChatItem(name: name)
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .background(Color(.systemGray6).edgesIgnoringSafeArea(.all))
        }
    }
}

// MARK: - Quick Action Buttons
struct HomeFeatureButton: View {
    let icon: String
    let title: String
    let color: Color
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .background(color)
                .clipShape(Circle())
            
            Text(title)
                .font(.subheadline)
                .bold()
                .foregroundColor(.primary)
        }
        .padding()
    }
}

// MARK: - Recent Chat Item
struct RecentChatItem: View {
    let name: String
    
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.gray)
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)
                Text("Last message preview...")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Text("2m ago")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 3)
        .padding(.horizontal)
    }
}

#Preview {
    HomeView()
}
