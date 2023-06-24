//
//  WebService.swift
//  e-commerce-elekctra-SwifIUI
//
//  Created by Edgar Tobón Sosa on 23/06/23.
//

import Foundation

class WebService:ObservableObject{
    @Published var articulos: Tienda? //Arreglo de modelo producto
    
    //Metodo para hacer fetch a la API
    func getArticulos(){
        let stringURL = "http://alb-dev-ekt-875108740.us-east-1.elb.amazonaws.com/sapp/productos/plp/1/ad2fdd4bbaec4d15aa610a884f02c91a"
        
        guard let url = URL(string: stringURL)else{
            return
        }
        let urlRequest = URLRequest(url: url)
        //Metodo asincrono fetch data
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data , response , errorFetch ) in
            
            if let  error = errorFetch {
                print (error)
                return
            }
            
            guard let respuesta = response as? HTTPURLResponse else {return}
            
            if respuesta.statusCode == 200 {
                guard let data = data else {return}
                DispatchQueue.main.async {
                    do{
                        let articulosDecodificados = try JSONDecoder().decode(Tienda.self, from: data)
                        self.articulos = articulosDecodificados
                        print(data)
                    }
                    catch let error{
                        print(error)
                    }
                }
            }
            
        }
        dataTask.resume()
    }
    
}


