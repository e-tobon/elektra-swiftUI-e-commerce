//
//  ArticuloRowView.swift
//  e-commerce-elekctra-SwifIUI
//
//  Created by Edgar Tobón Sosa on 24/06/23.
//

import SwiftUI

struct ArticuloRowView: View {
    let nombreArticulo:String?
    let imageURL:String?
    let precioFinal:Double?
    let categoria:String?
    var body: some View {
        VStack{
            Image("elektraLogo")
                .padding(.bottom)
            Text(nombreArticulo ?? "")
                .bold()
                .shadow(radius: 10)
                .multilineTextAlignment(.center)
                .padding()
        
            Text("$\(precioFinal ?? 0)")
                .frame(maxWidth:.infinity,alignment: .leading)
                .font(.system(size: 25))
                .padding()
            HStack(spacing:0){
                Text("Categoria: ")
                    .font(.system(size: 12))
                Text(categoria ?? "")
                    .font(.system(size: 12))
                    .frame(maxWidth:.infinity,alignment: .leading)
                    .bold()
            }.padding()
        }
    }
}

struct ArticuloRowView_Previews: PreviewProvider {
    static var previews: some View {
        ArticuloRowView(nombreArticulo: "", imageURL: "", precioFinal: nil, categoria: nil)
    }
}
