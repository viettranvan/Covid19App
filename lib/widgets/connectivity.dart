import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

class CheckConnectivity extends StatelessWidget {
  final Widget childWidget;

  CheckConnectivity({required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return OfflineBuilder(
        connectivityBuilder:
            (BuildContext context, ConnectivityResult result, Widget child) {
          final bool isConnected = result != ConnectivityResult.none;
          return Stack(
            fit: StackFit.expand,
            children: [
              child,
              Positioned(
                  left: 0.0,
                  right: 0.0,
                  bottom: 0.0,
                  child: AnimatedContainer(
                    duration: const Duration(microseconds: 300),
                    color: isConnected ? Color(0xFF00EE44) : Color(0xFFEE4400),
                    child: isConnected ?
                    Center(
                        child: SizedBox(
                          height: 25.0,
                          child: Text(
                            "Đã có mạng trở lại",
                            style: TextStyle(color: Colors.white, fontSize: 16.0),),
                        )
                    ):
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 25.0,
                          child: Text("Không có kết nối Internet",style: TextStyle(color: Colors.white,fontSize: 16.0)),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        SizedBox(
                          height: 15.0,
                          width: 15.0,
                          child: CircularProgressIndicator(
                            strokeWidth: 3.0,
                          ),
                        )
                      ],
                    ),
                  )
              )
            ],
          );
        },
        child: this.childWidget,
      );
    });
  }
}
/*



 */