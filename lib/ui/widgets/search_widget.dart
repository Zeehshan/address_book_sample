import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final Function(String value) onChanged;

  const SearchWidget({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late TextEditingController _textController;

  double get widthButtonCancel => _textController.text.isEmpty ? 0 : 50;

  String _oldSearchText = '';

  Function(String value) get onChanged => widget.onChanged;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _textController.addListener(_onSearchTextChange);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _onSearchTextChange() {
    if (_oldSearchText != _textController.text) {
      if (_textController.text.isEmpty) {
        _oldSearchText = _textController.text;
        setState(() {});

        widget.onChanged.call(_textController.text);
        return;
      }

      _oldSearchText = _textController.text;
      widget.onChanged.call(_textController.text);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(children: [
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).splashColor,
              borderRadius: BorderRadius.circular(6),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: <Widget>[
                const Icon(
                  CupertinoIcons.search,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'search here',
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                    ),
                    controller: _textController,
                  ),
                ),
                AnimatedContainer(
                  width: widthButtonCancel,
                  duration: const Duration(milliseconds: 100),
                  child: GestureDetector(
                    onTap: () {
                      _textController.clear();
                      final currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    },
                    child: Center(
                      child: Text(
                        'cancel',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontSize: 12, color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
