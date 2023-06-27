class City {
  final String? lang;
  final String? cityName;
  final String? cityLatitude;
  final String? cityLongitude;
  final int? cityId;
  final bool? isCapital;
  final String? stationName;
  final String? tourismURL;
  final String? tourismBoardName;
  final bool? isDep;
  final String? timeZone;
  final String? isDST;
  final Member? member;
  final Forecast? forecast;
  final Climate? climate;

  City({
    this.lang,
    this.cityName,
    this.cityLatitude,
    this.cityLongitude,
    this.cityId,
    this.isCapital,
    this.stationName,
    this.tourismURL,
    this.tourismBoardName,
    this.isDep,
    this.timeZone,
    this.isDST,
    this.member,
    this.forecast,
    this.climate,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      lang: json['city']['lang'],
      cityName: json['city']['cityName'],
      cityLatitude: json['city']['cityLatitude'],
      cityLongitude: json['city']['cityLongitude'],
      cityId: json['city']['cityId'],
      isCapital: json['city']['isCapital'],
      stationName: json['city']['stationName'],
      tourismURL: json['city']['tourismURL'],
      tourismBoardName: json['city']['tourismBoardName'],
      isDep: json['city']['isDep'],
      timeZone: json['city']['timeZone'],
      isDST: json['city']['isDST'],
      member: Member.fromJson(json['city']['member']),
      forecast: Forecast.fromJson(json['city']['forecast']),
      climate: Climate.fromJson(json['city']['climate']),
    );
  }
}

class Member {
  final int? memId;
  final String? memName;
  final String? shortMemName;
  final String? url;
  final String? orgName;
  final String? logo;
  final int? ra;

  Member({
    this.memId,
    this.memName,
    this.shortMemName,
    this.url,
    this.orgName,
    this.logo,
    this.ra,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      memId: json['memId'],
      memName: json['memName'],
      shortMemName: json['shortMemName'],
      url: json['url'],
      orgName: json['orgName'],
      logo: json['logo'],
      ra: json['ra'],
    );
  }
}

class Forecast {
  final String? issueDate;
  final String? timeZone;
  final List<ForecastDay>? forecastDay;

  Forecast({
    this.issueDate,
    this.timeZone,
    this.forecastDay,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    List<dynamic>? forecastDayData = json['forecastDay'];
    List<ForecastDay>? forecastDayList = forecastDayData != null
        ? forecastDayData.map((e) => ForecastDay.fromJson(e)).toList()
        : null;

    return Forecast(
      issueDate: json['issueDate'],
      timeZone: json['timeZone'],
      forecastDay: forecastDayList,
    );
  }
}

class ForecastDay {
  final String? forecastDate;
  final String? wxdesc;
  final String? weather;
  final String? minTemp;
  final String? maxTemp;
  final String? minTempF;
  final String? maxTempF;
  final int? weatherIcon;

  ForecastDay({
    this.forecastDate,
    this.wxdesc,
    this.weather,
    this.minTemp,
    this.maxTemp,
    this.minTempF,
    this.maxTempF,
    this.weatherIcon,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    return ForecastDay(
      forecastDate: json['forecastDate'],
      wxdesc: json['wxdesc'],
      weather: json['weather'],
      minTemp: json['minTemp'],
      maxTemp: json['maxTemp'],
      minTempF: json['minTempF'],
      maxTempF: json['maxTempF'],
      weatherIcon: json['weatherIcon'],
    );
  }
}

class Climate {
  final String? raintype;
  final String? raindef;
  final String? rainunit;
  final String? datab;
  final String? datae;
  final int? tempb;
  final int? tempe;
  final String? rdayb;
  final String? rdaye;
  final int? rainfallb;
  final int? rainfalle;
  final String? climatefromclino;
  final List<ClimateMonth>? climateMonth;

  Climate({
    this.raintype,
    this.raindef,
    this.rainunit,
    this.datab,
    this.datae,
    this.tempb,
    this.tempe,
    this.rdayb,
    this.rdaye,
    this.rainfallb,
    this.rainfalle,
    this.climatefromclino,
    this.climateMonth,
  });

  factory Climate.fromJson(Map<String, dynamic> json) {
    List<dynamic>? climateMonthData = json['climateMonth'];
    List<ClimateMonth>? climateMonthList = climateMonthData != null
        ? climateMonthData.map((e) => ClimateMonth.fromJson(e)).toList()
        : null;

    return Climate(
      raintype: json['raintype'],
      raindef: json['raindef'],
      rainunit: json['rainunit'],
      datab: json['datab'],
      datae: json['datae'],
      tempb: json['tempb'],
      tempe: json['tempe'],
      rdayb: json['rdayb'],
      rdaye: json['rdaye'],
      rainfallb: json['rainfallb'],
      rainfalle: json['rainfalle'],
      climatefromclino: json['climatefromclino'],
      climateMonth: climateMonthList,
    );
  }
}

class ClimateMonth {
  final int? month;
  final String? maxTemp;
  final String? minTemp;
  final String? meanTemp;
  final String? maxTempF;
  final String? minTempF;
  final String? meanTempF;
  final String? raindays;
  final String? rainfall;
  final String? climateFromMemDate;

  ClimateMonth({
    this.month,
    this.maxTemp,
    this.minTemp,
    this.meanTemp,
    this.maxTempF,
    this.minTempF,
    this.meanTempF,
    this.raindays,
    this.rainfall,
    this.climateFromMemDate,
  });

  factory ClimateMonth.fromJson(Map<String, dynamic> json) {
    return ClimateMonth(
      month: json['month'],
      maxTemp: json['maxTemp'],
      minTemp: json['minTemp'],
      meanTemp: json['meanTemp'],
      maxTempF: json['maxTempF'],
      minTempF: json['minTempF'],
      meanTempF: json['meanTempF'],
      raindays: json['raindays'],
      rainfall: json['rainfall'],
      climateFromMemDate: json['climateFromMemDate'],
    );
  }
}
