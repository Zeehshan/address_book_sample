import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  final String contact;
  final Function() onTap;
  const ContactWidget({Key? key, required this.contact, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: const Icon(Icons.account_circle),
      title: Text(contact),
      trailing: const Icon(Icons.arrow_forward),
    );
  }
}
