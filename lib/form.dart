import 'package:flutter/material.dart';
import 'models.dart';

typedef OnDelete();

class UserForm extends StatefulWidget {
  final Gadjo user;
  final state = _UserFormState();
  final OnDelete onDelete;

  UserForm({Key? key, required this.user, required this.onDelete})
      : super(key: key);
  @override
  _UserFormState createState() => state;

  bool isValid() => state.validate();
}

class _UserFormState extends State<UserForm> {
  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Material(
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        child: Form(
          key: form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBar(
                leading: Icon(Icons.account_circle),
                elevation: 0,
                title: Text('Petit gadjo'),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                centerTitle: true,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: widget.onDelete,
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                child: TextFormField(
                  initialValue: widget.user.name,
                  //onSaved: (val) => widget.user.name = val,
                  validator: (val) => (val?.length ?? 0) > 1
                      ? null
                      : 'Nom invalide (au moins 2 lettres)',
                  decoration: const InputDecoration(
                    labelText: 'Nom',
                    hintText: 'Comment s\'appelle le petit gadjo ?',
                    isDense: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                child: TextFormField(
                  initialValue: widget.user.location.name,
                  //onSaved: (val) => widget.user.loc = val,
                  decoration: const InputDecoration(
                    labelText: 'Localisation',
                    hintText: 'Où se trouve le petit gadjo ?',
                    isDense: true,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ///form validator
  bool validate() {
    var valid = form.currentState?.validate();
    if (valid ?? false) form.currentState?.save();
    return valid ?? false;
  }
}
