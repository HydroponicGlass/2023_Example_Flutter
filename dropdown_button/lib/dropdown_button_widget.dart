import 'package:flutter/material.dart';

class DropdownButtonWidget extends StatefulWidget {
  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidgetState();
  final ValueChanged<String?> onItemSelected;
  List<String> dropdownList = [];

  DropdownButtonWidget(List<String> dropdownList, this.onItemSelected){
    this.dropdownList = dropdownList;
  }
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  String? _selectedDropdown;

  void onDropdownButtonChanged(String? value){
    setState(() {
      _selectedDropdown = value;
      widget.onItemSelected(_selectedDropdown);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        width: double.infinity,
        height: 72,
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Center(
          child: DropdownButton(
            hint: Text('Select Dropdown'),
            value: _selectedDropdown,
            items: widget.dropdownList.map((value) {
              return DropdownMenuItem(
                  value: value,
                  child: Text(value, style: TextStyle(color: Colors.black),));
            }).toList(),
            onChanged: onDropdownButtonChanged,
            isExpanded: true,
            icon: SizedBox.shrink(), /* remove arrow icon */
          ),
        )
      ),
    );
  }
}