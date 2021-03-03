import SwiftUI

struct ForecastView: View {
  let viewModel: WeeklyWeatherViewModel
  var body: some View {
    List(viewModel.dataSource) { datasource in
      DailyWeatherRow(viewModel: DailyWeatherRowViewModel(item: datasource.item))
    }
  }
}
