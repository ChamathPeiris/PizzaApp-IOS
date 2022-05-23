//
//  AddPizzaView.swift
//  Pizza
//
//  Created by Chamath Peiris on 2022-05-10.
//

import SwiftUI

struct AddPizzaView: View {
    
    @StateObject private var vm: ViewModel = ViewModel()
    
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray
                    .opacity(0.2)
                VStack {
                    //form for add pizzas
                    TextField("Enter Pizza name", text: $vm.name)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .textInputAutocapitalization(.words)
                    CustomTextEditor.init(placeholder: "Enter ingredients", text: $vm.ingedients)
                        .font(.body)
                        .background(Color(UIColor.white))
                        .cornerRadius(8)
                        .padding()
                    
                    TextField("Enter Image name", text: $vm.imageName)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .textInputAutocapitalization(.never)
                    
                    TextField("Enter Image Thumbnail name", text: $vm.imageName)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    Picker(selection: $vm.selectedType, label: Text("Category")) {
                        Text("Meat🥩").tag(PizzaType.meat)
                        Text("Veggie🥗").tag(PizzaType.vegetarian)
                    }.pickerStyle(SegmentedPickerStyle()).foregroundColor(Color.orange)
                    .pickerStyle(.segmented)
                    .padding()
                    .pickerStyle(.segmented)
                    .padding(.horizontal)
                    
                    //add buttons for add pizzas and cancel the process
                    HStack {
                        Button(action: {
                            dismiss()
                        }) {
                            Label("Cancel", systemImage: "plus")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .labelStyle(.titleOnly)
                                .foregroundColor(.blue)
                                .border(.blue)
                                .cornerRadius(5)

                        }
                        
                        Button(action: save) {
                            Label("Add", systemImage: "plus")
                                .labelStyle(.titleOnly)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(5.0)
                        }
                        
                    }
                    .padding()
                    Spacer()
                }
            }
            .navigationTitle("New Pizza")
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $vm.shouldShowAlert, content: {
                Alert(title: Text("Fill all the Fields"), message: Text(""))
            })
        }
    }
    
    private func save() {
        //after all the fields are filled then save the pizza
        withAnimation {
            if(vm.name.isEmpty || vm.imageName.isEmpty || vm.ingedients.isEmpty) {
                vm.shouldShowAlert = true
            } else {
                vm.savePizza()
                dismiss()
            }
        }
    }
}

struct AddPizzaView_Previews: PreviewProvider {
    static var previews: some View {
        AddPizzaView()
    }
}

struct CustomTextEditor: View {
    let placeholder: String
    @Binding var text: String
    let internalPadding: CGFloat = 5
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty  {
                Text(placeholder)
                    .foregroundColor(Color.primary.opacity(0.25))
                    .padding(EdgeInsets(top: 7, leading: 4, bottom: 0, trailing: 0))
                    .padding(internalPadding)
            }
            TextEditor(text: $text)
                .padding(internalPadding)
            
            
        }.onAppear() {
            UITextView.appearance().backgroundColor = .clear
        }.onDisappear() {
            UITextView.appearance().backgroundColor = nil
        }
    }
}
