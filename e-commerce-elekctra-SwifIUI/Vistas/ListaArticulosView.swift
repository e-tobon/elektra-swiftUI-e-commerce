//
//  ListaArticulosView.swift
//  e-commerce-elekctra-SwifIUI
//
//  Created by Edgar Tobón Sosa on 24/06/23.
//

import SwiftUI

struct ListaArticulosView: View {
    var articulos:[producto]?
    
    var body: some View {
        NavigationView{
            List(self.articulos!,id: \.id){
                articulo in
                NavigationLink(destination: ContentView(mostrar: false), label: {
                    ArticuloRowView(nombreArticulo: articulo.nombre, imageString: articulo.urlImagenes![0], precioFinal: articulo.precioFinal, categoria: articulo.codigoCategoria)
                })
                    
            }
        }.navigationBarBackButtonHidden(true)
       
    }
}

struct ListaArticulosView_Previews: PreviewProvider {
    static var previews: some View {
        ListaArticulosView()
    }
}
