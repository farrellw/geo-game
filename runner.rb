- (void) navigateToLatitude:(double)latitude
                  longitude:(double)longitude
{
  if ([[UIApplication sharedApplication]
    canOpenURL:[NSURL URLWithString:@"waze://"]]) {

      // Waze is installed. Launch Waze and start navigation
      NSString *urlStr =
        [NSString stringWithFormat:@"waze://?ll=%f,%f&navigate=yes",
        latitude, longitude];

      [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];

   } else {

      // Waze is not installed. Launch AppStore to install Waze app
      [[UIApplication sharedApplication] openURL:[NSURL
        URLWithString:@"http://itunes.apple.com/us/app/id323229106"]];
   }
}
