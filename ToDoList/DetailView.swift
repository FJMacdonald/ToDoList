//
//  DetailView.swift
//  ToDoList
//
//  Created by Francesca MACDONALD on 2023-08-24.
//

import SwiftUI

struct DetailView: View {
    var passedValue: String
    
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundColor(.orange)
            Text("You are a swifty legend")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(passedValue: "Hello World")
    }
}
