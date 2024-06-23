import SwiftUI
import MapKit

struct EventInformation {
    var name: String
    var description: String
    var time: String  // Consider using Date for time as well
    var capacity: Int
    var date: Date
    var coordinate: CLLocationCoordinate2D
}

struct CreateView: View {
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var eventdate: Date = Date()
    @State private var capacity: String = ""
    @State private var location: String = "" // New state variable for location
    
    @State private var isShowingAlert = false
    @State private var isShowingSuccessAlert = false
    
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        
        VStack {
            Text("Host Event")
                .font(.system(size: 40))
            
            Spacer()
            
            VStack {
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
            
            VStack {
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
            
            HStack {
                VStack {
                    Text("Event Date")
                        .offset(x: -80, y: 20)
                        .font(.system(size: 30))
                    
                    DatePicker("Select a date", selection: $eventdate, displayedComponents: .date)
                        .datePickerStyle(CompactDatePickerStyle())
                        .labelsHidden()
                        .padding()
                        .offset(x: -70)
                }
                .offset(x: 90)
                
                VStack {
                    Text("Location")
                        .offset(y:10)
                        .font(.system(size:30))
                    TextField("Enter location", text: $location) // Use location instead of description
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
            }
            
            Spacer()
            
            VStack {
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
                        capacity = newValue.filter { "0123456789".contains($0) }
                        if capacity.count > 5 {
                            capacity = String(capacity.prefix(5))
                        }
                    }
                    .offset(x: -130)
            }
            
            Spacer()
            
            Button("Create Event") {
                if title.isEmpty || description.isEmpty || eventdate == Date() || capacity.isEmpty || location.isEmpty {
                    isShowingAlert = true
                } else {
                    createEvent()
                    isShowingSuccessAlert = true
                }
            }
            .alert(isPresented: $isShowingAlert) {
                Alert(
                    title: Text("Please fill all required fields"),
                    dismissButton: .default(Text("OK")) {
                        isShowingAlert = false
                    }
                )
            }
            .alert(isPresented: $isShowingSuccessAlert) {
                Alert(
                    title: Text("Event Created"),
                    message: Text("Your event has been successfully created."),
                    dismissButton: .default(Text("OK")) {
                        isShowingSuccessAlert = false
                    }
                )
            }
            .padding()
        }
    }
    
    private func createEvent() {
        let newEvent = EventInformation(
            name: title,
            description: description,
            time: "", // You can format event time as needed
            capacity: Int(capacity) ?? 0,
            date: eventdate,
            coordinate: CLLocationCoordinate2D() // You can provide actual coordinates here
        )
        
        // Here you can store newEvent or perform other operations with it
        print("Created event:", newEvent)
        
        // For demo purpose, reset fields after creating event
        title = ""
        description = ""
        eventdate = Date()
        capacity = ""
        location = ""
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
