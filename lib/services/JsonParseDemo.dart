import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './Services.dart';
import './Users.dart';

class JasonParseDemo extends StatefulWidget {
  JasonParseDemo({Key key}) : super(key: key);

  @override
  _JasonParseDemoState createState() => _JasonParseDemoState();
}

class _JasonParseDemoState extends State<JasonParseDemo> {
  List<User> _users;
  bool _loading = true;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getUserFromJson().then((users) {
      setState(() {
        _users = users;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Colors.grey[300],
          padding: EdgeInsets.all(12),
          child: Center(
              child: Text(_loading ? "Carregando" : "${_users.length}" ?? "0")),
        ),
        Expanded(
          child: Container(
            color: Colors.black12,
            child: Scrollbar(
              isAlwaysShown: true,
              controller: _scrollController,
              thickness: 16,
              radius: Radius.circular(48),
              child: ListView.separated(
                controller: _scrollController,
                itemCount: null == _users ? 0 : _users.length,
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.black26,
                  );
                },
                itemBuilder: (context, index) {
                  User user = _users[index];
                  return MouseRegion(
                    cursor: SystemMouseCursors.move,
                    child: ListTile(
                      title: Text("${user.name}"),
                      subtitle:
                          Text("${user.address.city}  ${user.address.street}"),
                      trailing: Text("${user.address.geo.lat}"),
                      contentPadding: EdgeInsets.only(
                        bottom: 12,
                        top: 12,
                        left: 8,
                        right: 28,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
