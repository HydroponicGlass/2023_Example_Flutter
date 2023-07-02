import 'package:flutter/material.dart';
import 'user.dart';

class AutoCompleteWidget extends StatefulWidget {
  const AutoCompleteWidget({super.key});

  @override
  State<AutoCompleteWidget> createState() => _AutoCompleteWidgetState();
}

class _AutoCompleteWidgetState extends State<AutoCompleteWidget> {
  bool isLoading = false;
  late List<User> autoCompleteData1;
  late List<User> autoCompleteData2;

  Future fetchAutoCompleteData() async {
    // fetch start
    // Show loading indicator
    setState(() {
      isLoading = true;
    });

    // final String stringData = await rootBundle.loadString("assets/data.json");
    // final List<dynamic> json = jsonDecode(stringData);
    // final List<String> jsonStringData = json.cast<String>();
    // fetch done
    setState(() {
      isLoading = false;
      autoCompleteData1 = [
        User("apple", "1"),
        User("Banana", "2"),
        User("Cherry", "3"),
        User("Cherry", "4"),
        User("Cherry", "5"),
      ];
      autoCompleteData2 = [
        User("dog", "6"),
        User("cat", "7"),
        User("fish", "8"),
      ];
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
                Autocomplete<User>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text.isEmpty) {
                      return [];
                    } else {
                      final List<User> options = [];
                      final String searchText =
                          textEditingValue.text.toLowerCase();
                      /*  name search */
                      for (User item in autoCompleteData1) {
                        if (item.name.toLowerCase().contains(searchText)) {
                          options.add(item);
                        }
                      }
                      /*  age search  */
                      for (User item in autoCompleteData1) {
                        if (item.age.toLowerCase().contains(searchText)) {
                          options.add(item);
                        }
                      }

                      for (User item in autoCompleteData2) {
                        if (item.name.toLowerCase().contains(searchText)) {
                          options.add(item);
                        }
                      }
                      return options;
                    }
                  },
                  optionsViewBuilder:
                      (BuildContext context, AutocompleteOnSelected<User> onSelected, Iterable<User> options) {
                    return Material(
                        elevation: 4,
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            final option = options.elementAt(index);
                            return ListTile(
                              title: Text(option.name),
                              subtitle: Text(option.age.toString()),
                              onTap: () {
                                onSelected(option);
                              },
                            );
                          },
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: options.length,
                        ));
                  },
                  onSelected: (dynamic user) {
                    print("name : ${user.name}, age: ${user.age}");
                  },
                  displayStringForOption: (User user) => user.name,
                  fieldViewBuilder:
                      (context, controller, focusNode, onEditingComplete) {
                    return TextField(
                      controller: controller,
                      focusNode: focusNode,
                      onEditingComplete: onEditingComplete,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        hintText: "Search Something",
                        prefixIcon: Icon(Icons.search),
                      ),
                    );
                  },
                )
              ],
            ),
          );
  }
}
