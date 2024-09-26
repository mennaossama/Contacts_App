import 'package:contacts/data/contact_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Contactdatabase {
  final _myBox = Hive.box<ContactModel>('contactbox');

  void addContact(ContactModel contactModel) {
    _myBox.add(contactModel);
  }

  List<ContactModel> getContacts() {
    return _myBox.isNotEmpty ? _myBox.values.toList() : [];
  }

  void updateContact(int index, ContactModel contactModel) {
    _myBox.putAt(index, contactModel);
  }
}
