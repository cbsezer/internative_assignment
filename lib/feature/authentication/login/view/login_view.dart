import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:internative_assignment/core/constants/text_constants.dart';

import 'package:kartal/kartal.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

//  Future<LatLng> takeLatLong()async {
//     var position = await _determinePosition();
//     return LatLng(position.latitude, position.longitude);
//   }
//     takeData() async{
//      return await takeLatLong();
//    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white, title: Text('Login', style: context.textTheme.subtitle1), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //Placeholder(fallbackWidth: context.width / 2, fallbackHeight: context.height/4),
          Form(
            child: SizedBox(
              width: context.width * 0.9,
              child: Column(
                children: [
                  passwordTextField(context, text: TextConstants.instance.email),
                  context.emptySizedHeightBoxLow3x,
                  passwordTextField(context, text: TextConstants.instance.password),
                ],
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                // var data = await AuthService.instance.login(LoginModel(email: _emailController.text, password: _passwordController.text));
                // print('validation: ${data.validationErrors}');
                // print('hasError: ${data.hasError}');
                // print('message: ${data.message}');
                // print('token: ${data.token}');
              },
              child: Text('tıkla')),

//           ElevatedButton(onPressed: (){
//                   var dio = Dio();

// dio.post('http://test20.internative.net/Login/SignUp', data:  {
//   "Email": "cagla@gmail.com",
//   "Password": "cbs123",
//   "PasswordRetry": "cbs123"
// });
// //               NetworkManager.instance.dioRequest(path: 'Login/SignUp', method: 'POST', queryJson:  {
// //   "Email": "cagla",
// //   "Password": "cbs123",
// //   "PasswordRetry": "cbs123"
// // });

//           }, child: ListTile(leading: Icon(FontAwesomeIcons.signInAlt), title: Text('Login'),  )),
//                     ElevatedButton(onPressed: (){}, child: ListTile(leading: Icon(FontAwesomeIcons.signInAlt), title: Text('Register'),)),
          SizedBox(
            height: context.height * .3,
            width: context.width * .9,
            child: GoogleMap(
              // ignore: prefer_collection_literals
              markers: Set<Marker>.of(
                <Marker>[
                  Marker(
                      draggable: true,
                      markerId: const MarkerId('Marker'),
                      position: const LatLng(40.9792, 29.1206),
                      onDragEnd: ((newPosition) {})),
                ],
              ),

              mapType: MapType.hybrid,
              initialCameraPosition: const CameraPosition(
                target: LatLng(40.9792, 29.1206),
                zoom: 14.4746,
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField passwordTextField(BuildContext context, {required String text}) {
    return TextFormField(
      // controller: state.passwordController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        hintText: text,
        contentPadding: const EdgeInsets.all(10),
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            true ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {},
        ),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)), borderSide: BorderSide(color: Color(0xFFFE3E05))),
      ),

      obscureText: true,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.deny(RegExp(r'\ ')),
      ],
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
