import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft_app_flutter/api/api_state.dart';

import '../state/bloc/nft_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NftBloc, ApiState>(
        builder: (context, state) {
          final data = state.data;
          if(state.isLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state.isSuccess){
            return const Center(child: Text("Data has been loaded"));
          }
          if(state.isError){
            return Center(child: Text(state.error ?? ""));
          }
          return Container();
        },
      ),
    );
  }
}
