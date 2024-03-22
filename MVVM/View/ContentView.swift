//
//  ContentView.swift
//  MVVM
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PhoneNumberViewModel()

    var body: some View {
        VStack {
            TextField("Введите номер телефона", text: $viewModel.phoneNumber)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle()) 
            
            Button(action: {
                viewModel.formatPhoneNumber()
            }) {
                Text("Преобразовать")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            
            Text(viewModel.resultText)
                .padding()
        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
