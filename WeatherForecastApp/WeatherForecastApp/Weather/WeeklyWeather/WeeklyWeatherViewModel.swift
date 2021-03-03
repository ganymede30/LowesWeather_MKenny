import SwiftUI
import Combine

class WeeklyWeatherViewModel: ObservableObject {
  @Published var city: String = ""
  @Published var dataSource: [DailyWeatherRowViewModel] = []
  @Published var weatherFetchSuccess = false

  private let weatherFetcher: WeatherFetchable
  private var disposables = Set<AnyCancellable>()

  init(weatherFetcher: WeatherFetchable) {
    self.weatherFetcher = weatherFetcher
  }

  func lookupCityWeather() {
    disposables.forEach { $0.cancel() }
    $city
      .sink(receiveValue: fetchWeather(forCity:))
      .store(in: &disposables)
  }

  func fetchWeather(forCity city: String) {
    weatherFetcher.weeklyWeatherForecast(forCity: city)
      .map { response in
        response.list.map(DailyWeatherRowViewModel.init)
      }
      .map(Array.removeDuplicates)
      .receive(on: DispatchQueue.main)
      .sink(
        receiveCompletion: { [weak self] value in
          guard let self = self else { return }
          switch value {
          case .failure:
            self.dataSource = []
            self.weatherFetchSuccess = false
          case .finished:
            self.weatherFetchSuccess = true
            break
          }
        },
        receiveValue: { [weak self] forecast in
          guard let self = self else { return }
          self.dataSource = forecast
      })
      .store(in: &disposables)
  }
}

extension WeeklyWeatherViewModel {
  var currentWeatherView: some View {
    ForecastView(viewModel: self)
  }
}

