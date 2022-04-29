import 'package:flutter/material.dart';

import '../../../configs/routes/routes.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';
import 'widgets/widgets.dart';

final _contacts = <String>[
  'Adi Shamir',
  'Alan Kay',
  'Andrew Yao',
  'Barbara Liskov',
  'Kristen Nygaard',
  'Leonard Adleman',
  'Leslie Lamport',
  'Ole-Johan Dahl',
  'Peter Naur',
  'Robert E. Kahn',
  'Ronald L. Rivest',
  'Vinton G. Cerf',
];

class AddressBookScreen extends StatefulWidget {
  static const routeName = AppRoutes.addressBook;

  const AddressBookScreen({Key? key}) : super(key: key);

  @override
  State<AddressBookScreen> createState() => _AddressBookScreenState();
}

class _AddressBookScreenState extends State<AddressBookScreen> {
  String searchQuery = '';

  _navigateToContactDetailsScreen(String contact) {
    return Navigator.of(context).pushNamed(ContactDetailsScreen.routeName,
        arguments: ContactDetailsScreenArguments(name: contact));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: SearchWidget(
            onChanged: (String query) {
              setState(() {
                searchQuery = query.toLowerCase();
              });
            },
          ),
        ),
        body: CustomScrollView(
          slivers: [
            GroupedListViewWidget<String, String>(
              elements: _contacts
                  .where((e) => e.toLowerCase().contains(searchQuery))
                  .toList(),
              groupBy: (element) => element[0],
              groupComparator: (value1, value2) => value1.compareTo(value2),
              itemComparator: (item1, item2) => item1.compareTo(item2),
              groupSeparatorBuilder: (String value) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  value,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              itemBuilder: (_, String contact) => ContactWidget(
                contact: contact,
                onTap: () => _navigateToContactDetailsScreen(contact),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
