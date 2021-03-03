import SwiftUI

struct DailyWeatherRow: View {
  private let viewModel: DailyWeatherRowViewModel

  init(viewModel: DailyWeatherRowViewModel) {
    self.viewModel = viewModel
  }

  var body: some View {
    NavigationLink(
      destination: CurrentWeatherView(viewModel: viewModel)
        .navigationBarTitle("", displayMode: .inline
      )
    ) {
      VStack(alignment: .leading) {
        HStack {
          VStack(alignment: .leading) {
            Text("\(viewModel.title)")
              .font(.body)
          }
          Spacer()
          Text("Temp: \(viewModel.temperature)")
            .font(.body)
        }
      }
      .foregroundColor(.primary)
    }
  }
}
