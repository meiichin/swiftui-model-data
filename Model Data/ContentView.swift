//
//  ContentView.swift
//  Model Data
//
//  Created by Yuu on 17/09/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ProductView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Model product
struct ProductModel : Identifiable {
    let id: Int
    let productName: String
    let productImage: String
    let productPrice: Int
    let location: String
    let rateCount: Int
    let rateTotal: Int
    
    init(id: Int, productname: String, productimage: String, productprice: Int, location: String, ratecount: Int, ratetotal: Int) {
        
        self.id = id
        self.productName = productname
        self.productImage = productimage
        self.productPrice = productprice
        self.location = location
        self.rateCount = ratecount
        self.rateTotal = ratetotal
    }
}

// Component product
struct ProductView: View {
    var body: some View{
        VStack(alignment:.leading){
            // image
            ZStack(alignment:.topTrailing){
                Image("ninja-1")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(height: 200)
                    .clipped()
                
                Button(action: {print("OK")}){
                    Image(systemName: "heart")
                        .foregroundColor(Color.red)
                        .padding()
                }
            }
            
            // title and price
            Text("Ninja ZX-250R")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .padding(.leading)
                .padding(.trailing)
            Text("Rp. 100.000.000")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .padding(.leading)
                .padding(.trailing)
                .foregroundColor(Color.red)
            
            // location
            HStack{
                Image(systemName: "mappin.circle")
                Text("Kota Yogyakarta")
            }
            .padding(.leading)
            .padding(.trailing)
            
            // rate
            HStack{
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                }
            }
            .padding(.leading)
            .padding(.trailing)
            
            // button add cart
            Button(action: {print("OK")}){
                HStack{
                    Spacer()
                    HStack{
                        Image(systemName: "cart")
                        Text("Add to cart")
                            .font(.callout)
                    }
                    .padding()
                    Spacer()
                }
            }
            .background(Color.green)
            .foregroundColor(Color.white)
            .cornerRadius(10)
            .padding()
        }
        .background(Color("Color"))
        .cornerRadius(15)
    }
}
