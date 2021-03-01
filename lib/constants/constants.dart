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
const String loginRoute = '/login';
const String resetRoute = '/reset';
const String searchRoute = '/search';
const String profileRoute = '/profile';
const String detailsRoute = '/details';
const String settingsRoute = '/settings';
const String revenuesRoute = '/revenues';
const String treasuryRoute = '/treasury';
const String spendingsRoute = '/spendings';
const String categoriesRoute = '/categories';
const String addCategoryRoute = '/add_category';

// Preferences
const String themePref = 'theme';

// Numbers
const double min = 0;
const double max = 5000;

// Maps
const Map months = {
  "01": "JAN",
  "02": "FEV",
  "03": "MAR",
  "04": "AVR",
  "05": "MAI",
  "06": "JUI",
  "07": "JUL",
  "08": "AOÛ",
  "09": "SEP",
  "10": "OCT",
  "11": "NOV",
  "12": "DEC",
};
