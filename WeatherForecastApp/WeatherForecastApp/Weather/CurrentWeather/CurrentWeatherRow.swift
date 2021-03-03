import SwiftUI

struct CurrentWeatherRow: View {
  private let viewModel: DailyWeatherRowViewModel

  init(viewModel: DailyWeatherRowViewModel) {
    self.viewModel = viewModel
  }

  var body: some View {
    VStack {
        Text(viewModel.temperature)
          .font(.largeTitle)
          .foregroundColor(.primary)
          .padding(.top, 20)

      VStack(alignment: .leading) {
        HStack {
          Spacer()
          Text("Feels like:")
          Text(viewModel.feelsLike)
            .foregroundColor(.primary)
        }
        .padding(.top, 20)

        VStack(alignment: .leading) {
          Text(viewModel.title)
            .font(.title)
            .foregroundColor(.primary)
          Text(viewModel.fullDescription)
            .foregroundColor(.primary)
            .padding(.top, 5)
        }
        .padding(.top, 40)
      }
    }
  }
}
