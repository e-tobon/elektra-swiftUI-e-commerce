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
                .padding(.bottom)
            Text("Pantalla Led HKPro 32'' HD Smart TV HKP32SM8")
                .bold()
                .shadow(radius: 10)
                .multilineTextAlignment(.center)
                .padding()
            
            Text("$5000.0")
                .frame(maxWidth:.infinity,alignment: .leading)
                .font(.system(size: 25))
                .padding()
            HStack(spacing:0){
                Text("Categoria: ")
                    .font(.system(size: 12))
                Text("c")
                    .font(.system(size: 12))
                    .frame(maxWidth:.infinity,alignment: .leading)
                    .bold()
            }.padding()
        }
    }
}

struct ArticuloRowView_Previews: PreviewProvider {
    static var previews: some View {
        ArticuloRowView()
    }
}
