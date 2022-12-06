import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.black,
          focusedBorder: _border(Colors.grey),
          border: _border(Colors.grey),
          enabledBorder: _border(Colors.grey),
          hintText: "Search here",
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ),
        onFieldSubmitted: (value) {},
      ),
    );
  }

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderSide: BorderSide(width: 0.5, color: color),
    borderRadius: BorderRadius.circular(12),
  );

}