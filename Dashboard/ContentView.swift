//
//  ContentView.swift
//  PS1
//
//  Created by Rikash Anand on 3/22/24.
//


import SwiftUI
import CoreData


 struct WelcomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("Logo")
                    .imageScale(.medium)
                    .foregroundStyle(.tint)
                    .offset(y:-110)
                Text("Welcome to PS App")
                    .font(.largeTitle)
                    .padding()

                NavigationLink(destination: HomeView()) {
                    Text("Sign In")
                        .font(.title)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct HomeView: View {
    @State private var selectedDate = Date()
    @State private var isNotificationEnabled = false
    
    var body: some View {
            NavigationView {
                VStack(spacing: 20) {

                    VStack {
                        DatePicker("Select a Date", selection: .constant(Date()), displayedComponents: .date)
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .padding()
                    }

                    NavigationLink(destination: ScreenOneView()) {
                        HomeBox(title: "Upcoming Appointments", color: .green)
                    }

                    NavigationLink(destination: ScreenTwoView()) {
                        HomeBox(title: "Patient Information", color: .orange)
                    }
                }
                .navigationBarTitle("Home", displayMode: .inline)
                //.preferredColorScheme(isDarkMode ? .dark : .light)
                .navigationBarItems(
                    leading: Button(action: {
                        // Handle action for bell icon (notification)
                        self.isNotificationEnabled.toggle()
                    }) {
                        Image(systemName: isNotificationEnabled ? "bell.fill" : "bell")
                            .font(.title)
                            .foregroundColor(.blue)
                    },
                    trailing: Button(action: {
                        // Handle action for logout button
                        
                    }) {
                        Text("Logout")
                    }
                )
            }
        }
    }

struct HomeBox: View {
    let title: String
    let color: Color

    var body: some View {
        Text(title)
            .font(.title2)
            .padding()
            .foregroundColor(.white)
            .background(color)
            .cornerRadius(10)
    }
}

//struct for Upcoming Appointments
struct ScreenOneView: View {
    var body: some View {
        Text("Upcoming Appointments")
            .font(.title)
            .padding()
    }
}

struct ScreenTwoView: View {
    var body: some View {
        Text("Patient Information")
            .font(.title)
            .padding()
    }
}

struct ScreenThreeView: View {
    var body: some View {
        Text("Tasks")
            .font(.title)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
