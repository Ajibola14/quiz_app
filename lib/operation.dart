import 'package:flutter/material.dart';
import 'package:quiz_app/difficulty.dart';

class Operation extends StatelessWidget {
  const Operation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.blue.shade700,
        title: const Text("Choose Operation"),
      ),
      body: Column(
        children: [
          InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Difficulty(operation: "+");
                  },
                ));
              },
              child: tileCont("Addition", "+")),
          const Divider(
            height: 2,
            thickness: 2,
          ),
          InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Difficulty(operation: "-");
                  },
                ));
              },
              child: tileCont("Substraction", "-")),
          const Divider(
            height: 2,
            thickness: 2,
          ),
          InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Difficulty(operation: "*");
                  },
                ));
              },
              child: tileCont("Multiplication", "*")),
          const Divider(
            height: 2,
            thickness: 2,
          ),
          InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Difficulty(operation: "/");
                  },
                ));
              },
              child: tileCont("Division", "/")),
          const Divider(
            height: 2,
            thickness: 2,
          ),
        ],
      ),
    );
  }

  Widget tileCont(String operationStr, String operation) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10.0, 8.0, 2.0),
      child: ListTile(
        title: Text(
          "\u0087 $operationStr",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 25,
              color: Colors.blue.shade800),
        ),
      ),
    );
  }
}
