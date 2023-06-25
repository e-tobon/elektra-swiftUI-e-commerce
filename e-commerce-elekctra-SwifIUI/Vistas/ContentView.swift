//
//  ContentView.swift
//  e-commerce-elekctra-SwifIUI
//
//  Created by Edgar Tobón Sosa on 23/06/23.
//

import SwiftUI

struct ContentView: View{
    
    var WebApi = WebService()
     @State var articulos:[producto]?
     @State var hideLoader:Bool = true
     @State var showFirstScreen:Bool = true
        
    
    var body: some View {
        VStack{
            if(showFirstScreen){
                Image("elektraLogo")
                    .padding(.bottom)
                    .padding(80)
                ZStack{
                    Button{
                        if articulos == nil {
                            self.WebApi.getArticulos()
                            hideLoader = false
                        }else{
                            print("La variable ya existe")
                        }
                    } label: {
                        Text("Ver articulos")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                    }
                }
                if(hideLoader){
                }else{
                    ProgressView()
                }
                
                
            }
                
        }.onAppear{
            self.WebApi.delegado = self
        }
            
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}

extension ContentView:WebServiceDelegate{
     func delegateUpdateProductos(productos: [producto]) {
         self.articulos = productos
         self.hideLoader = true
         self.showFirstScreen = false
         print(productos)
    }
    
    
}
