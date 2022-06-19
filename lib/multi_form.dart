import 'package:flutter/material.dart';
import 'empty_state.dart';
import 'form.dart';
import 'user.dart';

class MultiForm extends StatefulWidget {
  @override
  _MultiFormState createState() => _MultiFormState();
}

class _MultiFormState extends State<MultiForm> {
  List<UserForm> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: const Text('RDVerre'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white, // Text Color
            ),
            child: Text('C\'est parti !'),
            onPressed: onSave,
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF30C1FF),
              Color(0xFF2AA7DC),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: users.length <= 0
            ? Center(
                child: EmptyState(
                  title: 'C\'est vide',
                  message:
                      'Ajoute tes petits gadjos à l\'aide du bouton ci-dessous',
                ),
              )
            : ListView.builder(
                addAutomaticKeepAlives: true,
                itemCount: users.length,
                itemBuilder: (_, i) => users[i],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: onAddForm,
        foregroundColor: Colors.white,
      ),
    );
  }

  ///on form user deleted
  void onDelete(User _user) {
    setState(() {
      var find = users.firstWhere((it) => it.user == _user);
      if (find != null) users.removeAt(users.indexOf(find));
    });
  }

  ///on add form
  void onAddForm() {
    setState(() {
      var _user = User();
      users.add(UserForm(
        user: _user,
        onDelete: () => onDelete(_user),
      ));
    });
  }

  ///on save forms
  void onSave() {
    ///preliminary checks
    if (users.length <= 0) {
      print("No users entered");
      return (null);
    }
    var allValid = true;
    users.forEach((form) => allValid = allValid && form.isValid());
    if (!allValid) {
      print("Not all users are valid");
      return (null);
    }

    var data = users.map((it) => it.user).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: Text('Let\'s meet'),
          ),
          body: ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, int index) => ListTile(
              //leading: CircleAvatar(
              //  child: Text(data[index].name.substring(0, 1)),
              //),
              title: Text(data[index].name),
              subtitle: Text(data[index].loc),
            ),
          ),
        ),
      ),
    );
  }

  void onSaveOld() {
    ///this old function was used to render a list of all users entered when the "Let's go" button was clicked
    if (users.length > 0) {
      var allValid = true;
      users.forEach((form) => allValid = allValid && form.isValid());
      if (!allValid) {
        print("Not all users are valid");
        return (null);
      }
      var data = users.map((it) => it.user).toList();
      Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: Text('List of Users'),
            ),
            body: ListView.builder(
              itemCount: data.length,
              itemBuilder: (_, int index) => ListTile(
                //leading: CircleAvatar(
                //  child: Text(data[index].name.substring(0, 1)),
                //),
                title: Text(data[index].name),
                subtitle: Text(data[index].loc),
              ),
            ),
          ),
        ),
      );
    }
  }
}
