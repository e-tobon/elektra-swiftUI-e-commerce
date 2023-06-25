//
//  ProductoDetail.swift
//  e-commerce-elekctra-SwifIUI
//
//  Created by Edgar Tobón Sosa on 25/06/23.
//

import SwiftUI

struct ProductoDetail: View {
    let articulo:producto?
    @State var indexImage:Int = 0
    var body: some View {
        VStack{
            
            ArticuloNombre(nombreArticulo: articulo?.nombre!)
            ZStack{
                imagenesArticulo(stringImagenes: articulo?.urlImagenes, index: indexImage)
                    .frame(maxHeight: .infinity,alignment: .top)
                    .onTapGesture {
                        if(indexImage == (articulo?.urlImagenes?.count)! - 1){
                            indexImage = 0
                        }
                        else{
                            indexImage += 1
                        }
                    }
                if(articulo?.porcentajeDescuento! != 0){
                    porcentajeDescuento(porcentaje: articulo?.porcentajeDescuento!)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .frame(maxHeight: .infinity,alignment: .top)
                    
                }
            }
            Text("\(indexImage + 1) / ") + Text(String(articulo?.urlImagenes?.count ?? 0))
            
            HStack{
                preciosArticulo(precioAnterior: articulo?.precioRegular, precioActual: articulo?.precioFinal,Ahorro: articulo?.montoDescuento)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .frame(maxHeight: .infinity,alignment: .top)
                
                pagosSemanales(pagosSemanales: articulo!.pagoSemanalPrincipal!)
                    .padding()
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

struct preciosArticulo:View{
    var precioAnterior:Double?
    var precioActual:Double?
    var Ahorro:Double?
    
    var body: some View{
        VStack{
            if(Ahorro != 0){
                Text("Antes $\(precioAnterior?.redondear(numeroDeDecimales: 0) ?? "")")
                    .bold()
                    .shadow(radius: 5)
                    .foregroundColor(.gray)
                    .font(.system(size:20))
                
                Text("Ahora $\(precioActual?.redondear(numeroDeDecimales: 0) ?? "" )")
                    .bold()
                    .shadow(radius: 18)
                    .foregroundColor(.red)
                    .font(.system(size:25))
                    .padding(.leading)
                
                Text("Ahorras $\(Ahorro?.redondear(numeroDeDecimales: 0) ?? "")")
                        .bold()
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                        
            }else{
                Text("$\(precioActual?.redondear(numeroDeDecimales: 0) ?? "" )")
                    .bold()
                    .shadow(radius: 10)
                    .foregroundColor(.black)
                    .font(.system(size:28))
                    .padding(30)
            }
        }
    }
}

struct pagosSemanales:View{
    var pagosSemanales:Int?
    var body: some View{
        VStack{
            Text("Llevatelo con solo")
                .bold()
                .shadow(radius: 5)
                .foregroundColor(.red)
                .font(.system(size:13))
            
            Text("$\(pagosSemanales!)")
                .bold()
                .shadow(radius: 10)
                .foregroundColor(.black)
                .font(.system(size:25))
            
            Text("Semanales")
                .bold()
                .foregroundColor(.black)
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
