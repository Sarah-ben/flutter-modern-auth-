import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
Widget defaultFormField(
        {required BuildContext context,
        required String asset,
        required String hint,
        required TextEditingController controller,
        required validator,
        required textInputType,
          icon=Icons.visibility_outlined,
           onTap,
        obsText = false}) =>
    Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12))),
      width: MediaQuery.of(context).size.height,
      height: 40,
      child: Row(
        children: [
          Image.asset(
            asset,
            width: 20,
            height: 20,
          ),
          const SizedBox(
            width: 5,
          ),
          const VerticalDivider(
            color: Colors.black26,
            endIndent: 5,
            indent: 7,
          ),
          Expanded(
            child: TextFormField(
              keyboardType: textInputType,
              obscureText: obsText,
              validator: validator,
              controller: controller,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle:
                    const TextStyle(color: Colors.black38, fontSize: 15.0),
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          if (hint == 'Password')
             InkWell(child: Icon(icon),onTap:onTap,)
        ],
      ),
    );

Widget defaultText({
  required String mainText,
  required String secondText,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          mainText,
          style: const TextStyle(fontSize: 21.0, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(secondText,
            style: const TextStyle(fontSize: 15.0, color: Colors.grey)),
      ],
    );

navigateAndReplace(context, nextScreen) => Navigator.push(
    context, MaterialPageRoute(builder: (context) => nextScreen));

Widget defaultButton(onPressed) => Align(
    alignment: AlignmentDirectional.centerEnd,
    child: SizedBox(
        width: 60,
        height: 60,
        child: FlatButton(
            onPressed: onPressed,
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
            shape: const CircleBorder(),
            color: const Color.fromRGBO(50, 74, 89, 1))));

enum toastStates { error, warning, success }
toastColor(toastStates states) {
  Color color;
  switch (states) {
    case toastStates.error:
      color = Colors.red;
      break;
    case toastStates.warning:
      color = Colors.yellow;
      break;
    case toastStates.success:
      color = Colors.green;
      break;
  }
}
Future flutterToast(
    {required String msg,
      Color color = Colors.red,
      required toastStates state}) =>
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: toastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

