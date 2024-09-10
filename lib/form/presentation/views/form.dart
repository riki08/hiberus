import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hiberus/form/presentation/widgets/custom_textformfield.dart';
import 'package:hiberus/utils/constants/strings.dart';
import 'package:hiberus/widgets/layout_builder.dart';

class FormView extends StatefulWidget {
  const FormView({super.key});

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final _formKey = GlobalKey<FormState>();
  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];
  late DateTime selectedDate;
  TextEditingController nameController = TextEditingController();
  TextEditingController surNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    selectedDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: LayoutBuilderUtil(
        child: SizedBox(
          child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      writeName,
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CustomTextFormField(
                      maxLength: 50,
                      key: const Key("name"),
                      focusNode: _focusNodes[0],
                      fillColor: Colors.grey[100],
                      prefix: const Padding(padding: EdgeInsets.all(14.0), child: Icon(Icons.person)),
                      hintText: 'Escribe tu nombre aquí',
                      inputType: TextInputType.name,
                      textEditingController: nameController,
                      capitalization: TextCapitalization.none,
                      limit: [
                        LengthLimitingTextInputFormatter(70),
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return fieldRequired;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    Text(
                      writeSurName,
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CustomTextFormField(
                      key: const Key("surname"),
                      maxLength: 50,
                      focusNode: _focusNodes[1],
                      fillColor: Colors.grey[100],
                      prefix: const Padding(padding: EdgeInsets.all(14.0), child: Icon(Icons.person)),
                      hintText: 'Escribe tu apellido aquí',
                      inputType: TextInputType.name,
                      textEditingController: surNameController,
                      capitalization: TextCapitalization.none,
                      limit: [
                        LengthLimitingTextInputFormatter(70),
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return fieldRequired;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    Text(
                      writeEmail,
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CustomTextFormField(
                      key: const Key("email"),
                      maxLength: 50,
                      focusNode: _focusNodes[2],
                      fillColor: Colors.grey[100],
                      prefix: const Padding(padding: EdgeInsets.all(14.0), child: Icon(Icons.email)),
                      hintText: 'example@example.com',
                      inputType: TextInputType.emailAddress,
                      textEditingController: emailController,
                      capitalization: TextCapitalization.none,
                      limit: [
                        LengthLimitingTextInputFormatter(70),
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return fieldRequired;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Fecha de la prueba: ${selectedDate.day} de ${selectedDate.month} del ${selectedDate.year}",
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context.push("/cards");
                            }
                          },
                          child: Container(
                            width: 200,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.blue[800],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Iniciar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
