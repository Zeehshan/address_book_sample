import '../../../configs/routes/routes.dart';
import 'package:flutter/material.dart';

class ContactDetailsScreenArguments {
  final String name;
  ContactDetailsScreenArguments({required this.name});
}

class ContactDetailsScreen extends StatelessWidget {
  static const routeName = AppRoutes.contactDetails;

  const ContactDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments
        as ContactDetailsScreenArguments;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(arguments.name),
      ),
    );
  }
}
