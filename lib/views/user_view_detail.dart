import 'package:flutter/material.dart';
import 'package:younusorvba/constants/colors_of_app.dart';

class UserViewDetails extends StatefulWidget {
  static const route = 'UserViewDetails';
  const UserViewDetails({Key? key}) : super(key: key);

  @override
  _UserViewDetailsState createState() => _UserViewDetailsState();
}

class _UserViewDetailsState extends State<UserViewDetails> {
  @override
  Widget build(BuildContext context) {
    //?-----Media Query------
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ],
                ),
                Image.network("http://placeimg.com/640/480"),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  "Mechanic Detail",
                  style: TextStyle(
                    fontFamily: 'Comfortaa',
                    color: primaryColorDark,
                    fontSize: width * 0.09,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Zafar",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 7.0,
                        ),
                        const Text(
                          "Car Mechanic",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          width: width * 0.9,
                          child: const Text(
                            "I can help in your car repair. Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,"
                            "molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum"
                            "numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium"
                            "optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis"
                            "obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam"
                            "nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit,"
                            "tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,"
                            "quia. Quo neque error repudiandae fuga? Ipsa laudantium molestias eos "
                            "sapiente officiis modi at sunt excepturi expedita sint? Sed quibusdam"
                            "recusandae alias error harum maxime adipisci amet laborum. Perspiciatis",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
