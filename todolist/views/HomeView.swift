//
//  HomeView.swift
//  todolist
//
//  Created by Praveen on 14/10/23.
//

import SwiftUI

struct HomeView: View {
    @State private var showingAlert = false
    @State private var text=""
    @State private var todos:[String] = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    
     
    func addTodo(){
        if !text.isEmpty {
            todos.append(text)
            text = ""
        }
 
    }
    
    func deleteTodo(at index:Int){
        todos.remove(at: index)
    }
    
    var body: some View {
        
        NavigationView{
            VStack {
                List {
                    ForEach(Array(todos.enumerated()), id: \.element) { (index, item) in
                        HStack {
                            Text(item)
                            Spacer()
                            Button(action: {
                                deleteTodo(at: index )
                            }, label: {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                                    .imageScale(.large)
                            })
                        }
                    }
                }
                       
                
                HStack{
                    
                    TextField("Enter text",text: $text)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    
                    Button(action: {
                        addTodo()
                    }){
                        Text("add")
                            .padding()
                    }
                    
                    
                }
                
            }.navigationTitle("Todos")
        }
    }
    
}
#Preview {
    HomeView()
}
