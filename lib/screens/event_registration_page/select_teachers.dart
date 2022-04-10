import 'package:careerclub/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/constants.dart';
import '../../models/teachers_data_model.dart';
import '../../widgets/teacher_time_select.dart';

class SelectTeachers extends StatefulWidget {
  const SelectTeachers({
    Key? key,
    required this.eventModel,
    this.onSelectedTeacher,
  }) : super(key: key);

  final EventModel eventModel;

  final Function(List<String> selectedTeachers)? onSelectedTeacher;

  @override
  State<SelectTeachers> createState() => _SelectTeachersState();
}

class _SelectTeachersState extends State<SelectTeachers> {
  Map<int, String> selectedPeriod = {};

  List<String> dropdownValues = [];
  List<String> selectedTeachers = [];
  Map<String, String> items = {
    "select": "Select",
  };

  @override
  void initState() {
    super.initState();
    for (var element in widget.eventModel.periods!) {
      dropdownValues.add("Select");
      selectedTeachers.add('select');
      periods.forEach((key, value) {
        if (element == key) {
          selectedPeriod[element] = periods[element]!;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<TeacherDataModel> teachersData =
        Provider.of<List<TeacherDataModel>>(context);
    for (var element in teachersData) {
      items[element.email!] = element.name!;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              "Please Select Your Respective Period Teachers",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: selectedPeriod.length,
            itemBuilder: (_, index) {
              return TecherTimeSelect(
                time: selectedPeriod.values.elementAt(index),
                period: selectedPeriod.keys.elementAt(index).toString(),
                dropdown: (String? ddValues) {
                  setState(() {
                    dropdownValues[index] = ddValues!;
                    items.forEach((key, value) {
                      if (ddValues == value) {
                        selectedTeachers[index] = key;
                      }
                    });
                  });
                  widget.onSelectedTeacher!(selectedTeachers);
                },
                dropdownValue: dropdownValues[index],
                items: items,
              );
            },
          ),
        ],
      ),
    );
  }
}
