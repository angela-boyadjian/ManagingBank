import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:users/users_repository.dart';
import 'package:storage/storage_repository.dart';
import 'package:authentication/authentication_repository.dart';

import 'ui/theme.dart';
import 'logic/bloc/bloc.dart';
import 'logic/cubit/cubit.dart';
import 'ui/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();
  final AuthenticationRepository authenticationRepository =
      AuthenticationRepository();
  final UsersRepository usersRepository = UsersRepository();
  final StorageRepository storageRepository = StorageRepository();

  ThemeData getTheme(BuildContext context, PreferencesState state) {
    if (state is PreferencesLoaded) {
      context.watch<PreferencesCubit>().loadTheme();
    }
    if (state is PreferencesTheme) {
      return state.theme ? lightTheme : darkTheme;
    }
    return lightTheme;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: authenticationRepository,
        ),
        RepositoryProvider.value(
          value: usersRepository,
        ),
        RepositoryProvider.value(
          value: storageRepository,
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthenticationBloc(
                authenticationRepository: authenticationRepository),
          ),
          BlocProvider(create: (context) => PreferencesCubit()),
          BlocProvider(
              lazy: false,
              create: (context) => UserBloc(
                  usersRepository: usersRepository,
                  authBloc: BlocProvider.of<AuthenticationBloc>(context))),
          BlocProvider(
              lazy: false,
              create: (context) =>
                  StorageBloc(storageRepository: storageRepository)),
        ],
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus.unfocus();
            }
          },
          child: BlocBuilder<PreferencesCubit, PreferencesState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Mimi',
                theme: getTheme(context, state),
                onGenerateRoute: _appRouter.onGenerateRoute,
              );
            },
          ),
        ),
      ),
    );
  }
}
