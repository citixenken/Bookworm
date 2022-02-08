//
//  ContentView.swift
//  Bookworm
//
//  Created by Ken Muyesu on 05/02/2022.
//

import SwiftUI

struct ContentView: View {
//    @State private var rememberMe = false
//    @AppStorage("notes") private var notes = ""
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        VStack {
            List(students) { student in
                Text(student.name ?? "Unknown") //optional
            }
            Button("Add") {
                let firstNames = ["Aisha", "Zari", "Khadija", "Kidum", "Safina"]
                let lastNames = ["Bakari", "Scott", "Nun", "Kidumbwe", "Sacho"]
                
                let chosenFirstName = firstNames.randomElement()
                let chosenLastName = lastNames.randomElement()
                
                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(chosenFirstName ?? "") \(chosenLastName ?? "")"
                
                try? moc.save()
            }
        }
//        NavigationView {
//            TextEditor(text: $notes)
//                .navigationTitle("Notes")
//                .padding()
//        }
        
        
//        VStack {
//            PushButton(title: "Remember me", isOn: $rememberMe)
//            Text(rememberMe ? "On" : "Off")
//        }
    }
}

//struct PushButton: View {
//    let title: String
//    @Binding var isOn: Bool
//
//    var onColors = [Color.cyan, Color.mint]
//    var offColors = [Color(white: 0.6), Color(white: 0.4)]
//
//    var body: some View {
//        Button(title) {
//            isOn.toggle()
//        }
//        .padding()
//        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .bottomLeading, endPoint: .topTrailing))
//        .foregroundColor(.white)
//        .clipShape(Capsule())
//        .shadow(radius: isOn ? 0 : 5)
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
