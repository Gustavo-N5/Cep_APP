import 'package:flutter/material.dart';

Drawer drawerHelp() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text("User"),
          accountEmail: Text("User@email.com"),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
              child: Text("US"),
            ),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://img.freepik.com/fotos-gratis/edificios-do-centro-de-los-angeles-a-noite_649448-298.jpg?w=826&t=st=1686835723~exp=1686836323~hmac=83cd4689e2ddc54ffac723e7778ab83ec8ffd373dbb53359be43ef3ca017a8f6",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.exit_to_app),
          title: const Text("Exit"),
          onTap: () {},
        ),
      ],
    ),
  );
}
