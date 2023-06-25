//
//  ProductoDetail.swift
//  e-commerce-elekctra-SwifIUI
//
//  Created by Edgar Tobón Sosa on 25/06/23.
//

import SwiftUI

struct ProductoDetail: View {
    let articulo:producto?
    var body: some View {
        VStack{
            Text(articulo!.nombre!)
                .bold()
                .multilineTextAlignment(.center)
                .shadow(radius: 10)
            
            Image
        }
    }
}

struct ProductoDetail_Previews: PreviewProvider {
    static var previews: some View {
        ProductoDetail(articulo: nil)
    }
}
