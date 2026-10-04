import 'package:flutter/material.dart';

class OptionTile extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  OptionTile({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(

      alignment: Alignment.centerLeft,


      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 350),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 12),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 14),
            decoration: BoxDecoration(
              color: isSelected ? Color(0xFFF2F7FF) : Colors.white,
              border: Border.all(
                color: isSelected ? Color(0xFF1463FF) : Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(

              children: [

                Icon(
                  isSelected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,
                  color: isSelected ? Color(0xFF1463FF) : Colors.grey,
                  size: 22,
                ),
                SizedBox(width: 16),
                Expanded(child: Text(text)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}