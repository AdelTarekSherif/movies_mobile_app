import 'package:flutter/material.dart';
import 'package:movies_mobile_app/ui/common/custom_text_field.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        CustomTextField(
          cornerRadius: 50,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          suffixIcon: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.search,
                color: Colors.black,
              )),
        ),
        const Spacer(flex: 5,),
      ],
    );
  }
}
