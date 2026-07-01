import 'package:flutter/widgets.dart';
import 'package:fruits_ecommerce_app/core/widgets/custom_text_form_field.dart';

class AddressSection extends StatefulWidget {
  const AddressSection({super.key});

  @override
  State<AddressSection> createState() => _AddressSectionState();
}

class _AddressSectionState extends State<AddressSection> {
  late String fullName, email, address, city, floorNumber;
  late int phoneNumber;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'الاسم بالكامل',
                textInputType: TextInputType.name,
                onSaved: (value) {
                  fullName = value!;
                },
              ),
              SizedBox(height: 16),
        
                CustomTextFormField(
                hintText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value!;
                },
              ),
              SizedBox(height: 16),
                CustomTextFormField(
                hintText: 'العنوان',
                textInputType: TextInputType.name,
                onSaved: (value) {
                  address = value!;
                },
              ),
        
        
                 SizedBox(height: 16),
                CustomTextFormField(
                hintText: 'رقم الهاتف',
                textInputType: TextInputType.phone,
                onSaved: (value) {
                  phoneNumber = int.parse(value!);
                },
              ),
              SizedBox(height: 16),
                CustomTextFormField(
                hintText: 'المدينة',
                textInputType: TextInputType.name,
                onSaved: (value) {
                  city = value!;
                },
              ),
              SizedBox(height: 16),
                CustomTextFormField(
                hintText: 'رقم الطابق , رقم الشقه ..',
                textInputType: TextInputType.number,
                onSaved: (value) {
                  floorNumber = value!;
                },
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
