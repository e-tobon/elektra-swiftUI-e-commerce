//
//  ListaArticulosView.swift
//  e-commerce-elekctra-SwifIUI
//
//  Created by Edgar Tobón Sosa on 24/06/23.
//

import SwiftUI

struct ListaArticulosView: View {
    var body: some View {
        List{
            ArticuloRowView(nombreArticulo: "Television", imageURL: "", precioFinal: nil, categoria: "C")
        }
    }
}

struct ListaArticulosView_Previews: PreviewProvider {
    static var previews: some View {
        ListaArticulosView()
    }
}
