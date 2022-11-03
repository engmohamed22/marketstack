class APIEndPoints {
  static String marketStackApiKey = "5a579dc13845acfd9edaf9c394dffd6f";
  static String stockEndPoint =
      'http://api.marketstack.com/v1/eod?access_key=${marketStackApiKey}';

  static String tickersEndPoint =
      'http://api.marketstack.com/v1/tickers?access_key=${marketStackApiKey}&limit=10';
}
