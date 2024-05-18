import 'package:flutter/material.dart';

extension GapSeparate on List<Widget> {
  List<Widget> separate(double space) => length <= 1
      ? this
      : sublist(1).fold(
          [first],
          (previousValue, element) =>
              [...previousValue, SizedBox(height: space, width: space,), element],
        );

  List<Widget> separateTest(double space, {Widget? child}) => length <= 1
      ? this
      : sublist(1).fold([first], (previousValue, element) {
          if (element is Visibility) {
            if (element.visible) {
              return [
                ...previousValue,
                SizedBox(height: space/2),
                child ?? const SizedBox(),
                SizedBox(height: space/2),
                element,
              ];
            } else {
              return previousValue;
            }
          } else {
            return [
              ...previousValue,
              SizedBox(height: space/2),
              child ?? const SizedBox(),
              SizedBox(height: space/2),
              element
            ];
          }
        });
}
