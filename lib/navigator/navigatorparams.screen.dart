import 'package:flutter/material.dart';

class NavigatorParams extends StatefulWidget {
  const NavigatorParams({super.key});

  @override
  State<NavigatorParams> createState() => _NavigatorParamsState();
}

class _NavigatorParamsState extends State<NavigatorParams> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductDetail(
                    isActive: true,
                  ),
                ));
          },
          child: const Text("Product detail"),
        ),
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  final String id;
  final bool isActive;
  const ProductDetail({
    super.key,
    this.id = "0",
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Product : $id $isActive",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
