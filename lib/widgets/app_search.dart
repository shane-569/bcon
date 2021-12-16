import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({
    Key? key,
    required this.searchText,
    required this.onPressed,
    required this.suffixIcon,
  }) : super(key: key);

  final TextEditingController searchText;
  final VoidCallback onPressed;
  final Widget suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    offset: const Offset(0, 2),
                    blurRadius: 8.0),
              ],
            ),
            child: SizedBox(
              height: 55,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: TextFormField(
                    onChanged: (String txt) {},
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    cursorColor: Colors.red,
                    controller: searchText,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'search   ...',
                        suffix: suffixIcon),
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  offset: const Offset(0, 2),
                  blurRadius: 8.0),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onPressed,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(
                  Icons.search,
                  size: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
