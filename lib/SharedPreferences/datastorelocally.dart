import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Datastorelocally extends StatefulWidget {
  const Datastorelocally({super.key});

  @override
  State<Datastorelocally> createState() => _DatastorelocallyState();
}

class _DatastorelocallyState extends State<Datastorelocally> {
  // Variables to store user data
  String? username;
  String? phoneNumber;
  int? age;
  String? dob;

  // Controllers for text fields
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _phoneNumberController.dispose();
    _ageController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString("username");
      phoneNumber = prefs.getString("phoneNumber");
      age = prefs.getInt("age");
      dob = prefs.getString("dob");
    });
  }

  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("username", _usernameController.text);
    await prefs.setString("phoneNumber", _phoneNumberController.text);

    // Handle empty or invalid age input
    int parsedAge = int.tryParse(_ageController.text) ?? 0;
    await prefs.setInt("age", parsedAge);

    await prefs.setString("dob", _dobController.text);

    // Reload stored data first
    loadData();

    // Clear text fields after saving
    setState(() {
      _usernameController.clear();
      _phoneNumberController.clear();
      _ageController.clear();
      _dobController.clear();
    });
  }

  void clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      username = null;
      phoneNumber = null;
      age = null;
      dob = null;
      _usernameController.clear();
      _phoneNumberController.clear();
      _ageController.clear();
      _dobController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Data Store')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _dobController,
              decoration: InputDecoration(
                labelText: 'Date of Birth (YYYY-MM-DD)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.datetime,
            ),
            SizedBox(height: 20),

            // Buttons to save and clear data
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: saveData,
                  child: Text('Save Data'),
                ),
                ElevatedButton(
                  onPressed: clearData,
                  child: Text('Clear Data'),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Display stored data
            if (username != null) Text("Username: $username"),
            if (phoneNumber != null) Text("Phone Number: $phoneNumber"),
            if (age != null) Text("Age: $age"),
            if (dob != null) Text("Date of Birth: $dob"),
          ],
        ),
      ),
    );
  }
}
