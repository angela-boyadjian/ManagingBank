// Enums
enum TabScreens {
  Transactions,
  Results,
  Declarations,
  Profile,
}

enum AuthenticationStatus {
  Authenticated,
  Unauthenticated,
  Unknown,
  Success,
  Error
}

enum UserStatus { Initial, Loading, Success, Error, NoUser }

enum StorageStatus { Initial, Loading, UploadSuccess, DownloadSuccess, Error }

// Routes
const String splashRoute = '/';
const String homeRoute = '/home';
const String loginRoute = '/login';
const String resetRoute = '/reset';
const String searchRoute = '/search';
const String profileRoute = '/profile';
const String detailsRoute = '/details';
const String settingsRoute = '/settings';
const String revenuesRoute = '/revenues';
const String treasuryRoute = '/treasury';
const String spendingsRoute = '/spendings';

// Preferences
const String themePref = 'theme';

// Numbers
const double min = 0;
const double max = 5000;
