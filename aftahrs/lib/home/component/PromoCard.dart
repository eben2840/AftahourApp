import 'package:flutter/material.dart';

class PromoCardSlider extends StatefulWidget {
  const PromoCardSlider({Key? key}) : super(key: key);

  @override
  State<PromoCardSlider> createState() => _PromoCardSliderState();
}

class _PromoCardSliderState extends State<PromoCardSlider> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> _imageUrls = [
    "https://firebasestorage.googleapis.com/v0/b/ineruu-142dc.appspot.com/o/ineruu-142dc-default-rtdb%2FImages%2Fappbackground.jpg1734534371667.jpg?alt=media&token=6e571f45-49b1-437f-a262-1f190cd273aa",
    "https://firebasestorage.googleapis.com/v0/b/ineruu-142dc.appspot.com/o/ineruu-142dc-default-rtdb%2FImages%2Fappbackground1.jpg1734534406170.jpg?alt=media&token=b46dcbf7-5b16-45c0-adfa-d251427ff81b", // Replace with your image URL
    "https://thumbs.dreamstime.com/b/close-up-freshly-baked-pizza-banner-topped-melted-cheese-red-bell-peppers-mushrooms-parsley-wooden-serving-board-342980956.jpg", // Replace with your image URL
    // "https://cdn.psdrepo.com/images/2x/pizza-poster-j6.jpg", // Replace with your image URL
  ];

  @override
  void initState() {
    super.initState();
    // Automatic sliding
    Future.delayed(const Duration(seconds: 3), _autoSlide);
  }

  void _autoSlide() {
    if (_pageController.hasClients) {
      int nextPage = (_currentIndex + 1) % _imageUrls.length;
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentIndex = nextPage;
      });
      Future.delayed(const Duration(seconds: 3), _autoSlide);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _imageUrls.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      _imageUrls[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _imageUrls.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: _currentIndex == index ? 12 : 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? Colors.red
                      : Colors.grey.shade400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}