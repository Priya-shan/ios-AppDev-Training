//
//  ContentView.swift
//  Weather-SwiftUI
//
//  Created by Shanmuga Priya M on 07/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight:Bool = false
    @State private var joke: String = ""
    var body: some View {
        ZStack{
            BackgroundColor(isNight : isNight )
            
            VStack{
                Text(joke)
                CityText(cityName: "Madurai, TamilNadu")
               
                MainWeather(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", degree: 78)
                HStack(spacing:20){
                    WeatherDayView(day: "Tue", imageName: "cloud.sun.rain.fill", degree: 76)
                    WeatherDayView(day: "Thu", imageName: "cloud.snow.fill", degree: 32)
                    WeatherDayView(day: "Fri", imageName: "cloud.rain.fill", degree: 76)
                    WeatherDayView(day: "Wed", imageName: "cloud.sun.bolt.fill", degree: 86)
                    WeatherDayView(day: "Sat", imageName: "cloud.moon.rain.fill", degree: 76)
                }
                
                Spacer()
                Button{
                    isNight.toggle()
                } label :{ WeatherButton(buttonName: "Change Day Time", foregroundColor: .blue, backgroundColor: .white)
                }
                Spacer()
            }
            .onAppear(){
                fetchJokes()
            }
            
        }
    }
    private func fetchJokes() {
            guard let url = URL(string: "https://api.chucknorris.io/jokes/random") else {
                print("Invalid URL")
                return
            }

            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }

                if let data = data {
                    do {
                        let decodedResponse = try JSONDecoder().decode(Joke.self, from: data)
                        DispatchQueue.main.async {
                            joke = decodedResponse.value
                        }
                    } catch {
                        print("Error decoding JSON: \(error.localizedDescription)")
                    }
                }
            }

            task.resume()
        }
}
struct Joke: Codable {
    let value: String
}
#Preview {
    ContentView()
}
struct BackgroundColor:View {
    var isNight:Bool
    var body: some View {
        LinearGradient(
            
            colors: [isNight ? .black :  .blue , isNight ? .gray :  Color("LightBlue")],
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}
struct WeatherDayView:View {
    var day:String
    var imageName:String
    var degree:Int
    var body: some View {
        VStack{
            Text(day)
                .font(.system(size: 25, weight: .bold))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:50,height: 50)
            Text("\(degree)°")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.white)
        }
    }
}

struct CityText:View {
    var cityName:String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32,weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(20)
    }
}


struct MainWeather:View {
    var imageName:String
    var degree:Int
    var body: some View {
        VStack{
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180)
            
            Text("\(degree)°")
                .font(.system(size: 82, weight: .bold))
                .foregroundColor(.white)
        }.padding(.bottom,30)
    }
}

struct WeatherButton:View {
    var buttonName:String
    var foregroundColor:Color
    var backgroundColor:Color
    var body: some View {
        Text("Change Theme")
            .font(.system(size: 23))
            .frame(width: 350,height: 50)
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .cornerRadius(20)
    }
}
