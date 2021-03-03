import Combine
import SwiftUI

struct CityNameEntryView: View {
  @ObservedObject var viewModel: WeeklyWeatherViewModel
  @State private var isLoading = false

  init(viewModel: WeeklyWeatherViewModel) {
    self.viewModel = viewModel
  }

  var body: some View {
    NavigationView {
      ZStack {
        VStack {
          TextField("City Name", text: $viewModel.city)
            .multilineTextAlignment(.center)
          Divider()
          Button("Lookup") {
            viewModel.lookupCityWeather()
            isLoading = true
          }
          .foregroundColor(.primary)
          .frame(width: 200, height: 35.0)
          .overlay(
            Capsule(style: .continuous)
              .stroke(Color.gray, style: StrokeStyle(lineWidth: 1.0, dash: []))
          )
          .disabled(isLoading)
          NavigationLink(
            destination: viewModel.currentWeatherView
              .navigationBarTitle(viewModel.city, displayMode: .inline)
              .navigationBarHidden(false),
            isActive: $viewModel.weatherFetchSuccess
          ) {
            EmptyView()
          }
        }
        ActivityIndicator(isAnimating: $isLoading, style: .large)
      }
      .onDisappear(perform: {
        isLoading = false
      })
    }
    .navigationBarTitle("City Name", displayMode: .inline)
    .navigationBarHidden(false)
  }
}
