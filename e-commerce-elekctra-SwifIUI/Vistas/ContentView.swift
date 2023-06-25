//
//  ContentView.swift
//  e-commerce-elekctra-SwifIUI
//
//  Created by Edgar Tobón Sosa on 23/06/23.
//

import SwiftUI

struct ContentView: View{
     var showFirstScreen:Bool?
    var articulo:producto?
     private var WebApi = WebService()
     
     @State private var articulos:[producto]?
     @State private var hideLoader:Bool = true
        @State private var Showpop:Bool = false
     @State private var action:Int? = 0
    
    init(mostrar:Bool,articulo:producto?){
        self.showFirstScreen = mostrar
        self.articulo = articulo
    }
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination:ListaArticulosView(articulos: self.articulos),tag:1,selection: $action){}
                    
                if(showFirstScreen == true){
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
                else{
                    if let articulo = self.articulo{
                        Text(articulo.nombre!)
                    }
                    
                }
            }.onAppear{
                self.WebApi.delegado = self
            }
            
        }.navigationBarBackButtonHidden(true)
        
            
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView(mostrar: false,articulo: nil)
    }
}

extension ContentView:WebServiceDelegate{
     func delegateUpdateProductos(productos: [producto]) {
         self.articulos = productos
         self.hideLoader = true
         self.action = 1
         print(productos)
    }
    
    
}
