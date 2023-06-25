//
//  ArticuloRowView.swift
//  e-commerce-elekctra-SwifIUI
//
//  Created by Edgar Tobón Sosa on 24/06/23.
//

import SwiftUI

struct ArticuloRowView: View {
    let nombreArticulo:String?
    let imageString:String?
    let precioFinal:Double?
    let categoria:String?
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: imageString!)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 300, maxHeight: 250)
            } placeholder: {
                ProgressView()
            }


            Text(nombreArticulo ?? "")
                .bold()
                .shadow(radius: 10)
                .multilineTextAlignment(.center)
                .padding()
        
            Text("$\(precioFinal?.redondear(numeroDeDecimales: 2) ?? "")")
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
        ArticuloRowView(nombreArticulo: "", imageString: "", precioFinal: nil, categoria: nil)
    }
}


extension Double {
    func redondear(numeroDeDecimales: Int) -> String {
        let formateador = NumberFormatter()
        formateador.maximumFractionDigits = numeroDeDecimales
        formateador.roundingMode = .down
        return formateador.string(from: NSNumber(value: self)) ?? ""
    }
}
