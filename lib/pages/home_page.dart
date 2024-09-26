import 'package:contacts/components/contact_tile.dart';
import 'package:contacts/data/contact_model.dart';
import 'package:contacts/data/contactdatabase.dart';
import 'package:contacts/pages/edit_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final contactdatabase = Contactdatabase();
  List<ContactModel> contactList = [];
  @override
  void initState() {
    super.initState();
    contactList = contactdatabase.getContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Contacts",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        actions: [
          Padding(padding: EdgeInsets.all(8)),
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newContact = await Navigator.pushNamed(
            context,
            '/editpage',
          );
          if (newContact != null) {
            setState(() {
              contactList.add(newContact as ContactModel);
              contactdatabase.addContact(newContact as ContactModel);
            });
          }
        },
        backgroundColor: Colors.pink,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: contactList.length,
        itemBuilder: (context, index) {
          ContactModel contact = contactList[index];
          return ContactTile(
            name: contactList[index].name,
            number: contactList[index].number,
            onTap: () async {
              final updatecontact = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EditPage(contact)));
              if (updatecontact != null) {
                setState(() {
                  contactList[index] = updatecontact;
                  contactdatabase.updateContact(index, updatecontact);
                });
              }
            },
          );
        },
      ),
    );
  }
}
