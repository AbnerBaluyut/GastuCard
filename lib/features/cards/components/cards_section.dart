import 'package:flutter/material.dart';
import 'package:gastu_card/app/styles/dimension.dart';
import 'package:gastu_card/core/utils/extensions/double_ext.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../shared/constants/enums/credit_card_network_enum.dart';
import '../../../shared/widgets/common_credit_card.dart';
import '../../../shared/widgets/common_elevated_button.dart';
import '../../../shared/widgets/common_expandable_page_view.dart';

class CardsSection extends StatefulWidget {
  const CardsSection({super.key, required this.cards});
  final List<int> cards;
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
        CommonExpandablePageView.builder(
          controller: _pageController,
          itemBuilder: (context, index) {     

            String name = "";
            CreditCardNetworkEnum network = CreditCardNetworkEnum.visa;
            double totalCreditLimit = 0;
            double totalSpent = 0;
            Color backgroundColor = Colors.black;

            if (index == 0) {
              name = "RCBC FLEX";
              network = CreditCardNetworkEnum.visa;
              totalCreditLimit = 100000;
              totalSpent = 50000;
              backgroundColor = Colors.blue.shade900;
            } else if (index == 1) {
              name = "Metrobank MFree";
              network = CreditCardNetworkEnum.mastercard;
              totalCreditLimit = 60000;
              totalSpent = 10000;
              backgroundColor = Colors.brown.shade900;
            } else if (index == 2) {
              name = "UnionBank Rewards Platinum";
              network = CreditCardNetworkEnum.visa;
              totalCreditLimit = 15000;
              totalSpent = 1234.56;
              backgroundColor = Colors.orange.shade900;
            }

            return AnimatedBuilder(
              animation: _pageController,
              builder: (context, child) {
                final pageOffset = _pageController.page ?? _pageController.initialPage.toDouble();
                final diff = (pageOffset - index).abs();
                double value = (1 - diff * 0.2).clamp(0.92, 1.0);
                return Transform.scale(
                  scale: value,
                  child: child,
                );
              },
              child: CommonCreditCard(
                name: name,
                network: network,
                totalCreditLimit: totalCreditLimit,
                totalSpent: totalSpent,
                backgroundColor: backgroundColor,
              ),
            );
          },
          itemCount: widget.cards.length,
        ),
        SmoothPageIndicator(
          controller: _pageController,
          count: widget.cards.length,
          effect: ScrollingDotsEffect(
            dotHeight: 8,
            dotWidth: 8,
            activeDotScale: 1.5,
            activeDotColor: Colors.black,
            dotColor: Colors.grey.shade400,
          ),
        ),
        Dimension.spacingMedium.height(),
        CommonElevatedButton(
          backgroundColor: Colors.grey.shade800,
          onButtonPressed: () {},
          borderRadius: BorderRadius.circular(100.0),
          padding: EdgeInsets.symmetric(
            horizontal: Dimension.paddingMedium
          ),
          custom: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add, color: Colors.white, size: 24.0),
              Dimension.spacingSmall.width(),
              Text(
                "Add New Card",
                style: TextStyle(
                  fontSize: Dimension.fontMedium,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}