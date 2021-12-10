//
//  WellcomeView.swift
//  WeatherApp
//
//  Created by Yilmaz Edis (employee ID: y84185251) on 10.12.2021.
//

import SwiftUI
import CoreLocationUI

struct WellcomeView: View {

    @EnvironmentObject var locationManager: LocationManager

    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Wellcome to the Weather App").bold().font(.title)
                Text("Please share yout current location to get the weather in your area").padding()
            }.multilineTextAlignment(.center)
                .padding()
            LocationButton(.shareCurrentLocation) {
                locationManager.requestedLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)

        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WellcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WellcomeView()
    }
}
