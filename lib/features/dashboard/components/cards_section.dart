import 'package:flutter/material.dart';
import 'package:gastu_card/core/utils/extensions/double_ext.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../app/styles/dimension.dart';
import '../../../shared/constants/enums/credit_card_network_enum.dart';
import '../../../shared/widgets/common_credit_card.dart';

class CardsSection extends StatefulWidget {
  const CardsSection({super.key});
  @override
  State<StatefulWidget> createState() => _CardsSectionState();
}

class _CardsSectionState extends State<CardsSection> {

  final PageController _pageController = PageController(
    viewportFraction: 0.87
  );
  
  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        SizedBox(
          height: 210.0,
          child: PageView.builder(
            controller: _pageController,
            itemBuilder: (context, index) {              
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  final pageOffset = _pageController.page ?? _pageController.initialPage.toDouble();
                  final diff = (pageOffset - index).abs();
                  double value = (1 - diff * 0.2).clamp(0.9, 1.0);
                  return Transform.scale(
                    scale: value,
                    child: child,
                  );
                },
                child: CommonCreditCard(
                  name: (index == 0) ? "RCBC FLEX VISA" : "METROBANK MFREE",
                  network: (index == 0) ? CreditCardNetworkEnum.visa : CreditCardNetworkEnum.mastercard,
                  totalCreditLimit: (index == 0) ? 200000 : 500000,
                  totalSpent: (index == 0) ? 30000 : 5123.42,
                  backgroundColor: (index == 0) ? Colors.brown.shade900 : Colors.blue.shade900,
                ),
              );
            },
            itemCount: 2,
          ),
        ),
        Dimension.spacingMedium.height(),
        SmoothPageIndicator(
          controller: _pageController,
          count: 2,
          effect: ScrollingDotsEffect(
            dotHeight: 8,
            dotWidth: 8,
            activeDotScale: 1.5,
            activeDotColor: Colors.black,
            dotColor: Colors.grey.shade400,
          ),
        ),
      ],
    );
  }
}