//
//  CreateView.swift
//  SparkHub2024
//
//  Created by Justin Huang on 6/20/24.
//

import SwiftUI

struct CreateView: View {
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var eventdate: Date = Date()
    @State private var capacity: String = ""
    
    @State private var showingAlert = false
    @State private var name = ""
    @FocusState private var isTextFieldFocused: Bool

    
    var body: some View {

        VStack{
            Text("Host Event")
                .font(.system(size: 40))
            
            Spacer()
            
            VStack{
                Text("Title")
                    .offset(x: -150)
                    .font(.system(size: 30))
                TextField("", text: $title)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: isTextFieldFocused ? Color.blue.opacity(0.3) : Color.clear, radius: 4, x: 0, y: 0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(isTextFieldFocused ? Color.blue : Color.gray, lineWidth: 2)
                    )
                .padding()
            }
            
            Spacer()
            
            VStack{
                Text("Description")
                    .offset(x: -105)
                    .font(.system(size: 30))
                TextField("", text: $description)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: isTextFieldFocused ? Color.blue.opacity(0.3) : Color.clear, radius: 4, x: 0, y: 0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(isTextFieldFocused ? Color.blue : Color.gray, lineWidth: 2)
                    )
                    .padding()
                
            }
            Spacer()
            
            VStack{
                Text("Event Date")
                    .offset(x: -105)
                    .font(.system(size: 30))

                DatePicker("Select a date", selection: $eventdate, displayedComponents: .date)
                    .datePickerStyle(CompactDatePickerStyle())
                    .labelsHidden()
                    .padding()
                    .offset(x:-110)
            }
            
            Spacer()
            
            VStack{
                Text("Capacity")
                    .offset(x: -120)
                    .font(.system(size: 30))
                TextField("Enter 5-digit number", text: $capacity)
                    .frame(width: 50)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: isTextFieldFocused ? Color.blue.opacity(0.3) : Color.clear, radius: 4, x: 0, y: 0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(isTextFieldFocused ? Color.blue : Color.gray, lineWidth: 2)
                    )
                    .padding()
                    .onChange(of: capacity) { newValue in
                        // Filter out non-numeric characters
                        capacity = newValue.filter { "0123456789".contains($0) }
                        // Limit to 5 characters
                        if capacity.count > 5 {
                            capacity = String(capacity.prefix(5))
                        }
                    }
                    .offset(x: -130)
            }
            
            Spacer()
            
            Button("Create Event") {
                if(title.isEmpty || description.isEmpty || eventdate == Date() || capacity.isEmpty){
                    showingAlert.toggle()
                }
                else{
                    let newid = UUID().uuidString
                    let newEvent = Event(
                        id: newid,
                        title: title,
                        description: description,
                        eventdate: eventdate.timeIntervalSince1970,
                        capacity: Int(capacity) ?? 0
                    )
                }
            }
            
            
        }

        .alert("Please fill all required fields", isPresented: $showingAlert) {
            Button("OK", action: submit)
        }
    }

    func submit() {
    }
        
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }
}

#Preview {
    CreateView()
}
