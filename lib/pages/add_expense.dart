import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:intl/intl.dart';

import '../components/index.dart' as components;

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  late FocusNode _focusNodeTextField, _focusNodeDateField;
  final TextEditingController _controllerTextField = TextEditingController();
  final TextEditingController _controllerDateField = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNodeTextField = FocusNode();
    _focusNodeDateField = FocusNode();
    _focusNodeTextField.addListener(() {
      setState(() {});
    });
    _focusNodeDateField.addListener(() {
      setState(() {});
    });
    _controllerDateField.text =
        DateFormat('EEE, d MMMM yyyy').format(DateTime.now());
  }

  @override
  void dispose() {
    _focusNodeTextField.dispose();
    _focusNodeDateField.dispose();
    _controllerTextField.dispose();
    _controllerDateField.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: components.customText(
          text: 'Add Expense',
          fontSize: 18,
          fontWeight: FontWeight.w700,
          textColor: Colors.white,
        ),
        backgroundColor: const Color(0xFF429690),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 140, // Adjust this value as needed
                decoration: const BoxDecoration(
                  color: Color(0xFF429690),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(75),
                    bottomRight: Radius.circular(75),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.fromLTRB(28, 30, 28, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Text(
                        'AMOUNT',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF666666),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 350,
                      child: components.customTextField(
                          focusNode: _focusNodeTextField,
                          controller: _controllerTextField,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          hintText: 'Enter Amount',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          icon: Icons.attach_money,
                          suffixIcon: _focusNodeTextField.hasFocus
                              ? IconButton(
                                  onPressed: () {
                                    _controllerTextField.clear();
                                  },
                                  icon: const Icon(Icons.clear),
                                  iconSize: 20,
                                  color: Colors.red[900],
                                )
                              : null),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 24, 0, 10),
                      child: Text(
                        'DATE',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF666666),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 350,
                      child: components.customTextField(
                          focusNode: _focusNodeDateField,
                          controller: _controllerDateField,
                          hintText: 'Select Date',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          suffixIcon: IconButton(
                            onPressed: () {
                              if (defaultTargetPlatform == TargetPlatform.iOS) {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext builder) {
                                    return SizedBox(
                                      height: MediaQuery.of(context)
                                              .copyWith()
                                              .size
                                              .height /
                                          3,
                                      child: CupertinoDatePicker(
                                        initialDateTime: DateTime.now(),
                                        onDateTimeChanged: (DateTime newDate) {
                                          newDate = DateTime(newDate.year,
                                              newDate.month, newDate.day);

                                          String formattedDate =
                                              DateFormat('EEE, d MMMM yyyy')
                                                  .format(newDate);

                                          _controllerDateField.text =
                                              formattedDate;
                                        },
                                        maximumDate: DateTime(2100),
                                        minimumYear: 2000,
                                        maximumYear: 2100,
                                        mode: CupertinoDatePickerMode.date,
                                      ),
                                    );
                                  },
                                );
                              } else {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                );
                              }
                            },
                            icon: const Icon(Icons.calendar_today),
                            iconSize: 20,
                            color: _focusNodeDateField.hasFocus
                                ? const Color(0xFF429690)
                                : const Color(0xFF666666),
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(
                          28.0, 28.0, 28.0, 0.0), // Add this line
                      width: double.infinity,
                      height: 64,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF3E7C78).withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: const Offset(
                                0, 10), // changes position of shadow
                          ),
                        ],
                      ),
                      child: CupertinoButton(
                        onPressed: () {},
                        color: const Color(0xFF69AEA9),
                        borderRadius: BorderRadius.circular(40),
                        padding: EdgeInsets.zero,
                        child: components.customText(
                          text: 'Add Expense',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          textColor: const Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
