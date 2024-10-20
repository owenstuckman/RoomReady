import 'package:flutter/material.dart';
import 'package:room_ready/Startup/loading_page.dart';
import 'package:room_ready/GlobalStuff/local_data.dart';

class Languages extends StatefulWidget {
  const Languages({super.key});

  @override
  _LanguagesState createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  // List of common languages
  List<String> languages = [
  'AR - Arabic',
  'BG - Bulgarian',
  'CS - Czech',
  'DA - Danish',
  'DE - German',
  'EL - Greek',
  'EN - English (unspecified variant for backward compatibility)',
  'EN-GB - English (British)',
  'EN-US - English (American)',
  'ES - Spanish',
  'ET - Estonian',
  'FI - Finnish',
  'FR - French',
  'HU - Hungarian',
  'ID - Indonesian',
  'IT - Italian',
  'JA - Japanese',
  'KO - Korean',
  'LT - Lithuanian',
  'LV - Latvian',
  'NB - Norwegian Bokmål',
  'NL - Dutch',
  'PL - Polish',
  'PT - Portuguese (unspecified variant for backward compatibility)',
  'PT-BR - Portuguese (Brazilian)',
  'PT-PT - Portuguese (all Portuguese variants excluding Brazilian Portuguese)',
  'RO - Romanian',
  'RU - Russian',
  'SK - Slovak',
  'SL - Slovenian',
  'SV - Swedish',
  'TR - Turkish',
  'UK - Ukrainian',
  'ZH - Chinese (unspecified variant for backward compatibility)',
  'ZH-HANS - Chinese (simplified)',
  'ZH-HANT - Chinese (traditional)',
  ];

  // Variable to store selected language
  String? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Language'),
        backgroundColor: Colors.orange[100], // Optional background color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Dropdown menu for selecting a language
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Select your preferred language',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              value: selectedLanguage,
              onChanged: (newValue) {
                setState(() {
                  selectedLanguage = newValue;
                });
              },
              items: languages.map((String language) {
                return DropdownMenuItem<String>(
                  value: language,
                  child: Text(language),
                );
              }).toList(),
            ),
            SizedBox(height: 30),

            // "Next" Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                if (selectedLanguage != null) {
                  local_Data().saveLanguage(selectedLanguage!); 
                  print('Selected Language: $selectedLanguage');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Loading()), // Modify as needed
                  );
                } else {
                  // Show a message if no language is selected
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please select a language')),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
