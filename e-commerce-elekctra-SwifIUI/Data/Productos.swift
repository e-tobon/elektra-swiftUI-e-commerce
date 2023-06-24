//
//  Productos.swift
//  e-commerce-elekctra-SwifIUI
//
//  Created by Edgar Tobón Sosa on 23/06/23.
//

import Foundation

struct Tienda:Codable {
    let resultado:Articulos?
}

struct Articulos: Codable{
    let productos: [producto]?
}

struct producto: Codable{
    let id: String?
    let nombre: String?
    let urlImagenes:[String]?
    let precioFinal: Double?
    let codigoCategoria: String?
    let porcentajeDescuento: Double?
    let montoDescuento: Double?
    let precioRegular:Double?
    let pagoSemanalPrincipal:Int?
}
