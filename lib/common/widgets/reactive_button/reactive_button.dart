import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/reactive_button/reactive_button_cubit.dart';
import '../../bloc/reactive_button/reactive_button_state.dart';

class ReactiveButton extends StatelessWidget {
  final Future Function() onPressed;
  final String ? title;
  final double ? height;
  final double ? width;
  final Color ? activeColor;
  final VoidCallback onSuccess;
  final Function(String error) onFailure;
  const ReactiveButton({
    required this.onPressed,
    required this.onSuccess,
    required this.onFailure,
    this.title,
    this.height,
    this.width,
    this.activeColor,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReactiveButtonCubit(),
      child: BlocConsumer < ReactiveButtonCubit, ReactiveButtonState > (
        listener: (context, state) {
          if (state is ReactiveButtonSuccessState) {
            onSuccess();
          } else if (state is ReactiveButtonFailureState) {
            onFailure(state.errorMessage);
          }
        },
        builder: (context, state) {
          if (state is ReactiveButtonLoadingState) {
            return _loading(context);
          }
          return _initial(context);
        },

      ),
    );
  }

  Widget _loading(BuildContext context) {
    return ElevatedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: Colors.grey,
          minimumSize: Size(
              width ?? MediaQuery.of(context).size.width,
              height ?? 60
          ),
        ),
        child: const CircularProgressIndicator(color: Colors.white, )
    );
  }

  Widget _initial(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
          context.read<ReactiveButtonCubit>().execute(onPressed);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: activeColor ?? const Color(0xff3461FD),
          minimumSize: Size(
              width ?? MediaQuery.of(context).size.width,
              height ?? 60
          ),
        ),
        child: Text(
          title ?? 'Submit',
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400
          ),
        )
    );
  }
}
