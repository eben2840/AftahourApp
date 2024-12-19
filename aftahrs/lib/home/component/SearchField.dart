import 'package:aftahrs/searchpage/search_page.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Avoid triggering when user taps on the container
        FocusScope.of(context)
            .requestFocus(FocusNode()); // Unfocus any active text field
        _navigateToSearchPage(context); // Navigate to another page when tapped
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color:
              const Color(0xFF979797).withOpacity(0.1), // Gray background color
          borderRadius: BorderRadius.circular(15), // Rounded corners
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Color(0xFF757575)), // Search icon
            const SizedBox(width: 8), // Space between icon and text
            Text(
              "Search for vendor",
              style: TextStyle(color: const Color(0xFF757575), fontSize: 16),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                // Action when the filter icon is pressed
                _searchAction(''); // Pass empty value or modify accordingly
              },
              icon: const Icon(Icons.filter_list),
              color: const Color(0xFF757575), // Filter icon color
            ),
          ],
        ),
      ),
    );
  }

  // Function to navigate to another page
  void _navigateToSearchPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchPage(),
      ),
    );
  }

  void _searchAction(String value) {
    // Handle the search or action when filter icon is clicked
    print('Search value: $value');
  }
}
