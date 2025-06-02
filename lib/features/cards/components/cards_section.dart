import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:gastu_card/app/styles/dimension.dart';
import 'package:gastu_card/core/utils/extensions/double_ext.dart';
import 'package:gastu_card/core/utils/extensions/string_ext.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../app/routes/app_routes.dart';
import '../../../core/services/database/app_database.dart' as db;
import '../../../shared/constants/enums/credit_card_network_enum.dart';
import '../../../shared/widgets/common_credit_card.dart';
import '../../../shared/widgets/common_elevated_button.dart';


class CardsSection extends StatefulWidget {
  const CardsSection({super.key, required this.cards});
  final List<db.Card> cards;
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
        if (widget.cards.isNotEmpty) SizedBox(
          height: 210,
          child: PageView.builder(
            controller: _pageController,
            itemBuilder: (context, index) {     
              var card = widget.cards[index];
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
                  id: card.id,
                  name: card.bankName,
                  network: card.cardType.toCreditCardNetwork ?? CreditCardNetworkEnum.visa,
                  totalCreditLimit: card.creditLimit,
                  backgroundColor: card.cardColorHex?.toColor ?? Colors.red,
                ),
              );
            },
            itemCount: widget.cards.length,
          ),
        ),
        if (widget.cards.isNotEmpty && widget.cards.length > 1) SmoothPageIndicator(
          controller: _pageController,
          count: widget.cards.length,
          effect: ScrollingDotsEffect(
            dotHeight: 8,
            dotWidth: 8,
            activeDotScale: 1.5,
            activeDotColor: Colors.teal.shade900,
            dotColor: Colors.grey.shade400,
          ),
        ),
        if (widget.cards.length > 1) Dimension.spacingMedium.height(),
        CommonElevatedButton(
          backgroundColor: Colors.teal.shade900,
          onButtonPressed: () => context.push(AppRoutes.addCard),
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