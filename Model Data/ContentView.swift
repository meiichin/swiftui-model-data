//
//  ContentView.swift
//  Model Data
//
//  Created by Yuu on 17/09/21.
//

import SwiftUI

struct ContentView: View {
    // data dummy
    let data : [ProductModel] = [
        ProductModel(id: 1, productname: "Ninja XR-250R", productimage: "ninja-1", productprice: 100000000, location: "Kab. Sleman", ratecount: 4, ratetotal: 50),
        ProductModel(id: 2, productname: "Ninja XR-200R", productimage: "ninja-2", productprice: 243000000, location: "Kab. Bekasi", ratecount: 1, ratetotal: 50),
        ProductModel(id: 3, productname: "Ninja XR-150R", productimage: "ninja-3", productprice: 23000000, location: "Kab. Bantul", ratecount: 5, ratetotal: 50),
        ProductModel(id: 4, productname: "Ninja XR-100R", productimage: "ninja-4", productprice: 650000000, location: "Kab. Semarang", ratecount: 3, ratetotal: 50),
        ProductModel(id: 5, productname: "Ninja XR-50R", productimage: "ninja-5", productprice: 76000000, location: "Kab. Cabbage", ratecount: 4, ratetotal: 50),
        ProductModel(id: 6, productname: "Ninja XR-50R", productimage: "ninja-6", productprice: 65400000, location: "Kab. Laily", ratecount: 4, ratetotal: 50),
        ProductModel(id: 7, productname: "Ninja XR-20R", productimage: "ninja-7", productprice: 77000000, location: "Kab. Muntilan", ratecount: 3, ratetotal: 50),
        ProductModel(id: 8, productname: "Ninja XR-10R", productimage: "ninja-8", productprice: 86000000, location: "Kab. Laman", ratecount: 4, ratetotal: 50),
        ProductModel(id: 9, productname: "Ninja XR-50R", productimage: "ninja-9", productprice: 340000000, location: "Kab. Pontianak", ratecount: 2, ratetotal: 50),
        ProductModel(id: 10, productname: "Ninja XR-0R", productimage: "ninja-10", productprice: 100000000, location: "Kab. Sleman", ratecount: 4, ratetotal: 50)
    ]
    
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
