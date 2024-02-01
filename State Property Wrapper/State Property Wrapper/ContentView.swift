//
//  ContentView.swift
//  State Property Wrapper
//
//  Created by Manish Ahire on 01/02/24.
//

/*
 
  State - Its a current of anything

  For example - Car Dashboard
  It indicates state like:
  1. Petrol Level
  2. Distabce Covered
  3. Headlight are ON ot OFF
  etc

  As per apple - A State Property Wrapper can read and write a value managed by SwiftUI

  Note : @State proeprty wrapper only affect to currect view, we can't use the state in any other parent or child view. If we want to share the state between views then we need to use @Binding property wrapper


 
 */
import SwiftUI

struct ContentView: View {
    
    @State var name: String = String()
    
    var body: some View {
        VStack {
        
            Text("Your Name is: \(name)")
            
            TextField("Enter your Name", text: $name)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
