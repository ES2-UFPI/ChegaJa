import 'package:flutter/material.dart';

class ListContainer extends StatelessWidget {
  const ListContainer({
    Key? key,
    required this.child,
    required this.title,
    required this.action,
  }) : super(key: key);

  final Widget child;
  final String title;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
          height: MediaQuery.of(context).size.height - 200,
          width: MediaQuery.of(context).size.width - 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFFF5F5F5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                // spreadRadius: 5,
                blurRadius: 4,
                offset: const Offset(0, 4), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF262626),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, size: 35),
                      color: const Color(0xFFE30B86),
                      onPressed: () async {
                        action();
                      },
                    ),
                  ],
                ),
              ),
              Expanded(child: child),
            ],
          ),
        ),
      ),
    );
  }
}
