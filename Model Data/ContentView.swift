//
//  ContentView.swift
//  Model Data
//
//  Created by Yuu on 17/09/21.
//

import SwiftUI

struct ContentView: View {
    // data dummy
    let data : [DataModel] = [
        DataModel(id: 1, productname: "Ninja XR-250R", productimage: "ninja-1", productprice: 100000000, location: "Kab. Sleman", ratecount: 4, ratetotal: 50),
        DataModel(id: 2, productname: "Ninja XR-200R", productimage: "ninja-2", productprice: 243000000, location: "Kab. Bekasi", ratecount: 1, ratetotal: 50),
        DataModel(id: 3, productname: "Ninja XR-150R", productimage: "ninja-3", productprice: 23000000, location: "Kab. Bantul", ratecount: 5, ratetotal: 50),
        DataModel(id: 4, productname: "Ninja XR-100R", productimage: "ninja-4", productprice: 650000000, location: "Kab. Semarang", ratecount: 3, ratetotal: 50),
        DataModel(id: 5, productname: "Ninja XR-50R", productimage: "ninja-5", productprice: 76000000, location: "Kab. Cabbage", ratecount: 4, ratetotal: 50),
        DataModel(id: 6, productname: "Ninja XR-50R", productimage: "ninja-6", productprice: 65400000, location: "Kab. Laily", ratecount: 4, ratetotal: 50),
        DataModel(id: 7, productname: "Ninja XR-20R", productimage: "ninja-7", productprice: 77000000, location: "Kab. Muntilan", ratecount: 3, ratetotal: 50),
        DataModel(id: 8, productname: "Ninja XR-10R", productimage: "ninja-8", productprice: 86000000, location: "Kab. Laman", ratecount: 4, ratetotal: 50),
        DataModel(id: 9, productname: "Ninja XR-50R", productimage: "ninja-9", productprice: 340000000, location: "Kab. Pontianak", ratecount: 2, ratetotal: 50),
        DataModel(id: 10, productname: "Ninja XR-0R", productimage: "ninja-10", productprice: 100000000, location: "Kab. Sleman", ratecount: 4, ratetotal: 50)
    ]
    
//    @State var totalcart:Int = 0
    @ObservedObject var globaldata = GlobalObject()
    
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach(data) {
                    row in
                    VStack(spacing: 10){
                        ProductView(data: row, jumlahkeranjang: globaldata)
                    }
                }
            }
            .navigationBarTitle("Kawasaki Ninja")
            .navigationBarItems(trailing:
                HStack(spacing: 20){
                    Button(action: {print("atas")}){
                        Image(systemName: "person.fill")
                    }
                    Button(action: {print("atas")}){
                        Image(systemName: "star.fill")
                    }
                    NavigationLink(
                        destination: DetailView(globaldata: globaldata)){
                        CartView(jumlahkeranjang: globaldata)
                    }
                    
                }
            )
            
        }
        .accentColor(Color.secondary)
        // untuk ipad dan juga landscape
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct DetailView: View {
    @ObservedObject var globaldata : GlobalObject
    var body: some View{
        NavigationView{
            Text("Detail")
                .navigationBarTitle("Detail")
                .navigationBarItems(trailing:
                    HStack(spacing: 20){
                        Button(action: {print("atas")}){
                            Image(systemName: "person.fill")
                        }
                        Button(action: {print("atas")}){
                            Image(systemName: "star.fill")
                        }
                        CartView(jumlahkeranjang: globaldata)
                    }
                )
        }
    }
}

// component for cart
struct CartView: View {
//    @Binding var total:Int
    @ObservedObject var jumlahkeranjang : GlobalObject
    var body: some View{
        ZStack{
            Image(systemName: "cart.fill")
            Text("\(self.jumlahkeranjang.total)")
                .foregroundColor(Color.white)
                .frame(width: 10, height: 10)
                .font(.body)
                .padding(5)
                .background(Color.red)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .offset(x:10, y:-10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



// Component product
struct ProductView: View {
    
    let data: DataModel
//    @Binding var totalproduct:Int
    @ObservedObject var jumlahkeranjang : GlobalObject
    var body: some View{
        VStack(alignment:.leading){
            // image
            ZStack(alignment:.topTrailing){
                Image(self.data.productImage)
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
            Text(self.data.productName)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .padding(.leading)
                .padding(.trailing)
            Text("Rp. \(self.data.productPrice)")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .padding(.leading)
                .padding(.trailing)
                .foregroundColor(Color.red)
            
            // location
            HStack{
                Image(systemName: "mappin.circle")
                Text(self.data.location)
            }
            .padding(.leading)
            .padding(.trailing)
            
            // rate
            HStack{
                HStack{
                    // looping the star
                    ForEach(0..<self.data.rateCount){
                        items in
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                    }
                }
                .padding()
            }
            .padding(.leading)
            .padding(.trailing)
            
            // button add cart
            AddCartView(keranjang: jumlahkeranjang)
        }
        .background(Color("Color"))
        .cornerRadius(15)
    }
}



struct AddCartView: View {
//    @Binding var add:Int
    @ObservedObject var keranjang : GlobalObject
    var body: some View{
        Button(action: {self.keranjang.total += 1}){
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
}
