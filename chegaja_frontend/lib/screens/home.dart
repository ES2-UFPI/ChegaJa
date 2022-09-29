import 'package:chegaja_frontend/screens/deliveryman/home.dart';
import 'package:chegaja_frontend/screens/enterprise/delivery_list.dart';
import 'package:flutter/material.dart';
import '../components/gesture_button.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 380,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25.0),
                bottomLeft: Radius.circular(25.0),
              ),
              color: Color(0xFFB3C2FB),
            ),
            child: const ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25.0),
                bottomLeft: Radius.circular(25.0),
              ),
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/home_image.png'),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            "Encontre um entregador \nou faça uma entrega",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "Faça o login ou cadastro para começar \na fazer entregas ou contratar entregas",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF262626),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureButton(
                text: "Sou uma empresa",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DeliveryList(),
                    ),
                  );
                },
              ),
              GestureButton(
                text: "Sou entregador",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeDeliveryman(),
                    ),
                  );
                },
                color: const Color(0xFFF5F5F5),
              ),
            ],
          )
        ],
      ),
    );
  }
}
