import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Flutter code sample for [Autocomplete].

void main() => runApp(const AutocompleteExampleApp());

class AutocompleteExampleApp extends StatelessWidget {
  const AutocompleteExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Autocomplete Basic'),
        ),
        body: const Center(
          child: AutocompleteBasicExample(),
        ),
      ),
    );
  }
}

class AutocompleteBasicExample extends StatefulWidget {
  const AutocompleteBasicExample({super.key});

  @override
  State<AutocompleteBasicExample> createState() =>
      _AutocompleteBasicExampleState();
}

class _AutocompleteBasicExampleState extends State<AutocompleteBasicExample> {
  bool isLoading = false;
  late List<String> autoCompleteData;

  Future fetchAutoCompleteData() async {
    // fetch start
    // Show loading indicator
    setState(() {
      isLoading = true;
    });

    final String stringData = await rootBundle.loadString("assets/data.json");
    final List<dynamic> json = jsonDecode(stringData);
    final List<String> jsonStringData = json.cast<String>();
    // fetch done
    setState(() {
      isLoading = false;
      autoCompleteData = jsonStringData;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAutoCompleteData();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Autocomplete(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text.isEmpty) {
                    return const Iterable<String>.empty();
                  } else {
                    return autoCompleteData.where((element) => element
                        .toLowerCase()
                        .contains(textEditingValue.text.toLowerCase()));
                  }
                })
              ],
            ),
          );
  }
}
