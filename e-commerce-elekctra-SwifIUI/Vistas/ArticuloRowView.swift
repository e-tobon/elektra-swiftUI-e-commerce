//
//  ArticuloRowView.swift
//  e-commerce-elekctra-SwifIUI
//
//  Created by Edgar Tobón Sosa on 24/06/23.
//

import SwiftUI

struct ArticuloRowView: View {
    var body: some View {
        VStack{
            Image("elektraLogo")
            Text("Pantalla Led HKPro 32'' HD Smart TV HKP32SM8")
                .bold()
                .shadow(radius: 10)
                .multilineTextAlignment(.center)
                .padding()
            
            Text("$5000.0")
                .frame(maxWidth:.infinity,alignment: .leading)
                .font(.system(size: 25))
                .padding()
            HStack{
                Text("Categoria: ")
                    .font(.system(size: 12))
                    .frame(maxWidth:.infinity,alignment: .leading)
                Text("c")
                    .font(.system(size: 12))
                    .frame(maxWidth:.infinity,alignment: .leading)
            }
        }
    }
}

struct ArticuloRowView_Previews: PreviewProvider {
    static var previews: some View {
        ArticuloRowView()
    }
}
