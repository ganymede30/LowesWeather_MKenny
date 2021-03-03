import SwiftUI

struct CurrentWeatherView: View {
  private let viewModel: DailyWeatherRowViewModel

  init(viewModel: DailyWeatherRowViewModel) {
    self.viewModel = viewModel
  }

  var body: some View {
    ScrollView {
      CurrentWeatherRow(viewModel: viewModel)
    }
    .padding([.leading, .trailing], 20.0)
  }
}
