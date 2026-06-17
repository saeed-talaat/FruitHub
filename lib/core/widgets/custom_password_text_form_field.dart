import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/core/widgets/custom_text_form_field.dart';

class CustomPasswordTextFormField extends StatefulWidget {
  const CustomPasswordTextFormField({super.key, this.onSaved});
  final  Function(String?)? onSaved;
  @override
  State<CustomPasswordTextFormField> createState() =>
      _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState
    extends State<CustomPasswordTextFormField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      onSaved: widget.onSaved,
      suffixIconColor: Color(0xFFC9CECF),
      hintText: 'كلمة المرور',
      obscureText: obscureText,
      textInputType: TextInputType.visiblePassword,
      suffixIcon: Padding(
        padding: const EdgeInsets.only(left: 19),
        child: IconButton(
          onPressed: () {
            obscureText = !obscureText;
            setState(() {});
          },
          icon: obscureText
              ? Icon(Icons.visibility, size: 26)
              : Icon(Icons.visibility_off, size: 26),
        ),
      ),
    );
  }
}
