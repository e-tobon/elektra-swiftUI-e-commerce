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
            
            ArticuloNombre(nombreArticulo: articulo?.nombre!)
            ZStack{
                imagenesArticulo(stringImagenes: articulo?.urlImagenes, index: 0)
                    .frame(maxHeight: .infinity,alignment: .top)
                if(articulo?.porcentajeDescuento! != 0){
                    porcentajeDescuento(porcentaje: articulo?.porcentajeDescuento!)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .frame(maxHeight: .infinity,alignment: .top)
                }
            }
            
            
            
            
        
        }
    }
}

struct ArticuloNombre: View{
    var nombreArticulo:String?
    var body: some View{
        Text(nombreArticulo!)
            .bold()
            .multilineTextAlignment(.center)
            .shadow(radius: 10)
    }
}

struct imagenesArticulo:View{
    var stringImagenes:[String]?
    var index:Int
    var body: some View{
        AsyncImage(url: URL(string: stringImagenes![index] )) { image in
            image.resizable()
                .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 400, maxHeight: 350)
        } placeholder: {
            ProgressView()
        }
    }
}

struct porcentajeDescuento: View{
    var porcentaje:Double?
    var body: some View{
        VStack{
            Text("Hasta")
                .bold()
                .shadow(radius: 5)
                .foregroundColor(.red)
                .font(.system(size:13))
            Text("\(porcentaje?.redondear(numeroDeDecimales: 1) ?? "")%")
                .bold()
                .shadow(radius: 5)
                .foregroundColor(.red)
                .font(.system(size:18))
            Text("de descuento")
                .bold()
                .shadow(radius: 5)
                .foregroundColor(.red)
                .font(.system(size: 13))
                .padding(.leading)
            
        }
    }
}

struct ProductoDetail_Previews: PreviewProvider {
    static var previews: some View {
        ProductoDetail(articulo: nil)
    }
}
