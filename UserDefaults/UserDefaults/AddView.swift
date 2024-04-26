//
//  AddView.swift
//  UserDefaults
//
//  Created by 渡邊 翔矢 on 2023/12/21.
//
import Foundation
import SwiftUI

struct AddView: View {
    @State private var inputText: String = ""
    @State private var descriptionText: String = ""
    @State private var deadlineDate = Date()
    @Environment(\.dismiss) private var dismiss
    @Binding var todoItems: [ToDoItem]
    
    var body: some View {
        NavigationStack{
            TextField("ここに入力して下さい。", text: $inputText)
                .font(.title)
                .background(Color.primary)
                .padding(.horizontal)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .navigationTitle("Add Word")
            
            
            TextField("説明を入力して下さい。", text: $descriptionText)
                .font(.body)
                .background(Color.primary)
                .padding(.horizontal)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            DatePicker("期限", selection: $deadlineDate, displayedComponents: [.date, .hourAndMinute])
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding(.horizontal)
            
            
                .toolbar{
                    ToolbarItem(placement: .cancellationAction) {
                        Button("cancel") {
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("save") {
                            let newItem = ToDoItem(title: inputText, description: descriptionText, deadline: deadlineDate, id: UUID(), completed: false)
                            todoItems.append(newItem)
                            dismiss()
                        }
                    }
                }
        }
    }
}

#if DEBUG
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(todoItems: .constant([]))
    }
}
#endif
