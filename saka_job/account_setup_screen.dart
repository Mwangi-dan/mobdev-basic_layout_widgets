Dart
class AccountSetupScreen extends StatefulWidget {
  @override
  _AccountSetupScreenState createState() => _AccountSetupScreenState();
}

class _AccountSetupScreenState extends State<AccountSetupScreen> {
  final _formKey = GlobalKey<FormState>(); // For form validation
  String _fullName = ""; // Store user input

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Your SakaJob Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form( // Wrap everything in a Form widget for validation
          key: _formKey, // Assign the form key
          child: Column(
            children: [
              Text('Enter your details:'),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                ),
                validator: (value) { // Implement validation
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name.';
                  }
                  return null;
                },
                onSaved: (value) { // Store user input
                  _fullName = value!;
                },
              ),
              // Add more form elements here
              DropdownButtonFormField<String>( // Example dropdown
                value: _selectedJobType, // Store selected value
                hint: Text('Select Job Type'),
                items: [
                  DropdownMenuItem(
                    value: 'White Collar',
                    child: Text('White Collar'),
                  ),
                  DropdownMenuItem(
                    value: 'Blue Collar',
                    child: Text('Blue Collar'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedJobType = value!;
                  });
                },
              ),
              Row( // Example Row for buttons
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Space buttons evenly
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Validate and submit form
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save(); // Save form data
                        // Process user information (e.g., save to database)
                        print('Full Name: $_fullName, Job Type: $_selectedJobType'); // Example output
                      }
                    },
                    child: Text('Submit'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle cancel or clear form
                    },
                    child: Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _selectedJobType; // Variable to store selected job type
}
