import 'SearchModel.dart';
import 'package:flutter/material.dart';


class SearchWidget extends StatelessWidget {
  final SearchModel number;

  const SearchWidget({required this.number}) : assert(number != null);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<SearchState>(
      valueListenable: number.state,
      builder: (context, state, child) {
        double fontSize = 20;
        if (state == SearchState.search) {
          fontSize = 42;
        } else if (state == SearchState.found) {
          fontSize = 42;
        } else if (state == SearchState.searched) {
          fontSize = 20;
        }
        return AnimatedContainer(
          key: number.key,
          duration: const Duration(milliseconds: 900),
          curve: Curves.ease,
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            border: (state == SearchState.found)
                ? Border.all(
              color: Colors.green,
            )
                : null,
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          ),
          child: CustomTextStyle(fontSize: fontSize, number: number, numberValue: number.value.toString(), state: state),
        );
      },
      // child: AnimatedContainer(
      //   key: number.key,
      //   duration: const Duration(milliseconds: 900),
      //   curve: Curves.ease,
      //   width: 60,
      //   height: 60,
      //   decoration: BoxDecoration(
      //     border: (number.state.value == SearchState.found)
      //         ? Border.all(
      //             color: Colors.green,
      //           )
      //         : null,
      //     borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      //   ),
      //   child: AnimatedDefaultTextStyle(
      //     curve: Curves.easeOut,
      //     duration: const Duration(milliseconds: 300),
      //     style: TextStyle(
      //       fontSize: fontSize,
      //       decoration: (number.state.value == SearchState.discard)
      //           ? TextDecoration.lineThrough
      //           : TextDecoration.none,
      //       decorationStyle: TextDecorationStyle.solid,
      //       decorationThickness: 1.7,
      //       color: number.color,
      //     ),
      //     child: Center(
      //       child: Text(
      //         number.value.toString(),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

class CustomTextStyle extends StatelessWidget {
  final double fontSize;
  final SearchModel number;
  final String numberValue;
  final SearchState state;

  CustomTextStyle({
    required this.fontSize,
    required this.number,
    required this.numberValue,
    required this.state,
  });
      //: assert(fontSize != null && numberValue != null && state != null);

  @override
  Widget build(BuildContext context) {
    // return Text(numberValue);
    return AnimatedDefaultTextStyle(
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
      style: TextStyle(
        fontSize: fontSize,
        decoration: (state == SearchState.discard)
            ? TextDecoration.lineThrough
            : TextDecoration.none,
        decorationStyle: TextDecorationStyle.solid,
        decorationThickness: 1.7,
        color: number.color,
      ),
      child: Center(
        child: Text(
            numberValue
        ),
      ),
    );
  }
}