class Hourly {
  final int dt;
  final double temp;
  final double feelsLike;
  final double pressure;
  final double dewPoint;
  final double uvi;
  final double visibility;
  final double wind;
  final String description;
  final String icon;

  Hourly(this.dt, this.temp, this.feelsLike, this.pressure, this.dewPoint,
      this.uvi, this.visibility, this.wind, this.description, this.icon);
}
