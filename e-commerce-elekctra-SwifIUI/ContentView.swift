//
//  ContentView.swift
//  e-commerce-elekctra-SwifIUI
//
//  Created by Edgar Tobón Sosa on 23/06/23.
//

import SwiftUI




struct ContentView: View {
    var WebApi = WebService()
    var body: some View {
        VStack{
            
            Text("hola")
            
            
                        
        }.onAppear{
            WebApi.getArticulos()
        }
            
            
    }
}



struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
