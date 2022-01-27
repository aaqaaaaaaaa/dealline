import 'package:dealline/styles/styles.dart';
import 'package:flutter/material.dart';

class AppbarWidget extends StatefulWidget {
  const AppbarWidget({Key? key, required this.appBarTitle}) : super(key: key);
final String appBarTitle;
  @override
  _AppbarWidgetState createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends State<AppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 137,
      width: 300,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(1),
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/brand_logo/samsung-washing-machine.png',
              ))),
      child: Container(
        color: Colors.black.withOpacity(0.7),
        child: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () =>
                          Navigator.pop(context),
                      icon: Image.asset('assets/images/icons/ic_back.png')),
                   Text(
                    '${widget.appBarTitle}',
                    style: TextStyle(color: primaryColor, fontSize: 13),
                  ),
                ],
              ),
            ),
            SizedBox(height: 26,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ConstrainedBox(
                      constraints: BoxConstraints.tight(Size.square(18)),
                      child: Image.asset('assets/images/icons/korzina Icon.png')),
                  TextField()
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
