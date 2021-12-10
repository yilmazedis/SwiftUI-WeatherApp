//
//  ContentView.swift
//  WeatherApp
//
//  Created by Yilmaz Edis on 10.12.2021.
//

import SwiftUI

struct ContentView: View {

    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?

    var body: some View {
        VStack {

            if let location = locationManager.location {

                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    ProgressView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }

            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WellcomeView().environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
