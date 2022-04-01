import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);

class SearchForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Form(
        child: TextFormField(
          onSaved: (value) {},
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: "Rechercher une categorie...",
            border: outlineInputBorder,
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            errorBorder: outlineInputBorder,
           
            suffixIcon: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 10, vertical: 10),
              child: SizedBox(
                width: 48,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFF67952),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  onPressed: () {},
                // child: SvgPicture.asset("assets/icons/glacière vide.svg"),
                   child: Center(child: Icon(Icons.search)
                   )
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
