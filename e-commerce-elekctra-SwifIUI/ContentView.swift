//
//  ContentView.swift
//  e-commerce-elekctra-SwifIUI
//
//  Created by Edgar Tobón Sosa on 23/06/23.
//

import SwiftUI

var Anahi = Persona(name: "Anahi")

struct ContentView: View {
    var body: some View {
        VStack{
            
            Text(Anahi.name)
            var lookChane = Anahi.objectWillChange.sink { _ in
                Text(Anahi.name)
                print("Se cambiara el nombre de: \(Anahi.name)")
                Anahi.setNombre(nuevoNombre: "Jona")
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
