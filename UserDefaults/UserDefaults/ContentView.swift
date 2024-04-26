//
//  ContentView.swift
//  UserDefaults
//
//  Created by 渡邊 翔矢 on 2023/12/20.
//

import SwiftUI



struct ContentView: View {
    @State private var todoItems: [ToDoItem]
    @State private var completed = false
    @State private var isShowAddView = false
    
    init() {
        self.todoItems = []
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if todoItems.isEmpty {
                    Image(systemName: "paintbrush")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray)
                        .padding()
                    Text("＋ボタンを押してタスクを追加しよう")
                        .foregroundColor(.gray)
                } else {
                    List {
                        ForEach(todoItems) { item in
                            Button {
                                todoItems[todoItems.firstIndex(of: item)!].completed.toggle()
                            } label: {
                                HStack {
                                    Image(systemName: item.completed ?"checkmark.circle.fill" :"circle")
                                    VStack(alignment: .leading) {
                                        Text(item.title)
                                            .font(.title)
                                        Text("期限: \(formattedDeadline(for: item.deadline))")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                        Text("説明: \(item.description)")
                                            .font(.body)
                                            .foregroundColor(.secondary)
                                    }
                                }
                            }
                            .foregroundColor(.primary)
                        }
                        .onDelete { indexSet in
                            todoItems.removeAll { indexSet.contains(todoItems.firstIndex(of: $0)! )
                            }
                        }
                    }
                }
            }
            .navigationTitle("ToDo List")
            .toolbar{
                Button("+"){
                    isShowAddView = true
                }
            }
            .sheet(isPresented: $isShowAddView) {
                AddView(todoItems: $todoItems)
            }
        }
    }
    private func formattedDeadline(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDisplayName("No Tasks")
    }
}




