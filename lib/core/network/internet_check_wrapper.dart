import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketstack/core/di/di.dart';
import 'package:marketstack/core/widgets/no_internet_widget.dart';

import '../blocs/internet_bloc/internet_bloc.dart';

class InternetCheckWrapper extends StatelessWidget {
  const InternetCheckWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final internetBloc = injector<InternetBloc>();

    return BlocProvider.value(
      value: internetBloc,
      child: BlocConsumer<InternetBloc, InternetState>(
        listener: (context, state) {
          if (state is NotConnected) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('No Internet')));
          }
        },
        builder: (context, state) {
          if (state is NotConnected) {
            return const NoInternet();
          }
          return child;
        },
      ),
    );
  }
}
